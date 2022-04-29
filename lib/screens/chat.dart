import 'package:flutter/material.dart';
import 'package:soup_messenger/socket_handler.dart';
import 'package:soup_messenger/utils/custom_colors.dart';
import 'package:soup_messenger/utils/message_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key, required this.chatTitle, required this.isHost, required this.ipAddress, required this.username})
      : super(key: key);
  final String chatTitle;
  final bool isHost;

  final String ipAddress;
  final String username;

  @override
  State<ChatPage> createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final ScrollController _scrollController = ScrollController();
  late List<MessageBox> messages = List.empty();
  late SocketHandler _handler = SocketHandler(callback: (String message) {
    addMessage("sender", message);
    setState(() {});
  });

  void addMessage(String username, String message) {
    messages = messages.toList();
    messages.add(MessageBox(username: username, msg: message));
    print('Last message: ${messages[messages.length - 1].msg}');
    print('List length: ${messages.length}');
  }

  @override
  void initState() {
    if (widget.isHost) {
      _handler.startServer();
    } else {
      _handler.connectServer(widget.ipAddress);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (!widget.isHost) {
      _handler.socket.destroy();
    } else {
      _handler.server.close();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.chatTitle)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: ListView.builder(
                controller: _scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return messages[index];
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Form(
                    child: TextFormField(
                      style: const TextStyle(color: CustomColors.fontColor),
                      controller: _handler.msg,
                      decoration: const InputDecoration(
                        labelText: 'Message',
                        labelStyle: TextStyle(color: CustomColors.fontColor),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: CustomColors.fontColor, width: 1)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: CustomColors.selectedColor, width: 1)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: () {
                    if (!widget.isHost) {
                      _handler.sendMessage(_handler.msg.text);
                    } else {
                      _handler.returnMessage(_handler.msg.text);
                    }
                    _handler.msg.clear();
                    setState(() {});
                  },
                  tooltip: 'Send message',
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
