import 'package:flutter/material.dart';
import 'package:soup_messenger/screens/client.dart';
import 'package:soup_messenger/screens/server.dart';
import 'package:soup_messenger/utils/custom_colors.dart';
import 'package:soup_messenger/utils/ip_cooker.dart' as Network;

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String ip = "";

  @override
  void initState() {
    super.initState();
    main();
  }

  void main() async {
    ip = await Network.ip;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Soup ",
                  style: TextStyle(fontSize: 50, color: CustomColors.selectedColor),
                ),
                Text(
                  "| Chat",
                  style: TextStyle(fontSize: 50, color: CustomColors.fontColor),
                ),
              ],
            ),
            SizedBox(height: height / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        //MaterialPageRoute(builder: (context) => ChatPage(chatTitle: "Host")),
                        MaterialPageRoute(
                          builder: (context) => ServerPage(),
                        ));
                  },
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(width / 2 * 0.9, 50))),
                  child: const Text(
                    "Server",
                    style: TextStyle(fontSize: 30, color: CustomColors.fontColor),
                  ),
                ),
                SizedBox(width: 15),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        //MaterialPageRoute(builder: (context) => ChatPage(chatTitle: "Client")),
                        MaterialPageRoute(
                          builder: (context) => ClientPage(),
                        ));
                  },
                  style: ButtonStyle(fixedSize: MaterialStateProperty.all(Size(width / 2 * 0.9, 50))),
                  child: const Text(
                    "Join",
                    style: TextStyle(fontSize: 30, color: CustomColors.fontColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
