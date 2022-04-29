import 'package:flutter/cupertino.dart';
import 'package:soup_messenger/utils/custom_colors.dart';

class MessageBox extends StatelessWidget {
  const MessageBox({Key? key, required this.username, required this.msg}) : super(key: key);

  final String username;
  final String msg;
  //final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 3.5, color: CustomColors.fontColor), borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(username, style: TextStyle(color: CustomColors.selectedColor, fontSize: 25)),
            Text(msg, style: TextStyle(color: CustomColors.fontColor, fontSize: 20)),
            //Text(timestamp),
          ],
        ),
      ),
    );
  }
}
