import 'package:flutter/material.dart';
import 'package:soup_messenger/screens/chat.dart';
import 'package:soup_messenger/utils/custom_colors.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({Key? key}) : super(key: key);

  @override
  State<ClientPage> createState() => ClientPageState();
}

class ClientPageState extends State<ClientPage> {
  //SocketHandler handler = SocketHandler(callback: () {  });
  final TextEditingController _ipController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: width * 0.1, right: width * 0.1, top: 20, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              child: TextFormField(
                style: const TextStyle(color: CustomColors.fontColor),
                controller: _ipController,
                decoration: const InputDecoration(
                  labelText: 'IP Address',
                  labelStyle: TextStyle(color: CustomColors.fontColor),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColors.fontColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColors.selectedColor, width: 3.0)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Form(
              child: TextFormField(
                style: const TextStyle(color: CustomColors.fontColor),
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: CustomColors.fontColor),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColors.fontColor, width: 1.0)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: CustomColors.selectedColor, width: 3.0)),
                ),
              ),
            ),
            const SizedBox(height: 25),
            TextButton(
              onPressed: () {
                //handler.connectServer(handler.ip.text);
                Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => ChatPage(chatTitle: "Host")),
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        chatTitle: '',
                        isHost: false,
                        ipAddress: _ipController.text,
                        username: _usernameController.text,
                      ),
                    ));
              },
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(width * 0.9, 50))),
              child: const Text(
                "Join",
                style: TextStyle(fontSize: 30, color: CustomColors.fontColor),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
