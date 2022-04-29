import 'package:flutter/material.dart';
import 'package:soup_messenger/screens/chat.dart';
import 'package:soup_messenger/utils/custom_colors.dart';

class ServerPage extends StatefulWidget {
  const ServerPage({Key? key}) : super(key: key);

  @override
  State<ServerPage> createState() => ServerPageState();
}

class ServerPageState extends State<ServerPage> {
  //SocketHandler handler = SocketHandler();
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
                cursorColor: CustomColors.fontColor,
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
                print("Trying to start a server");
                //handler.startServer();
                Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => ChatPage(chatTitle: "Host")),
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        chatTitle: '',
                        isHost: true,
                        ipAddress: "localhost",
                        username: _usernameController.text,
                      ),
                    ));
              },
              style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(width * 0.9, 50))),
              child: const Text(
                "Host",
                style: TextStyle(fontSize: 30, color: CustomColors.fontColor),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
