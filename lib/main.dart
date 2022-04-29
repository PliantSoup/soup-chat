import 'package:flutter/material.dart';
import 'package:soup_messenger/screens/home.dart';
import 'package:soup_messenger/utils/custom_colors.dart';
import 'package:soup_messenger/utils/ip_cooker.dart' as IPCooker;

void main() async {
  //await IPCooker.saveFood();
  await IPCooker.cookIp(await IPCooker.getIp());
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soup Messenger',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(CustomColors.selectedColor),
            backgroundColor: MaterialStateProperty.all<Color>(CustomColors.mainColor),
            elevation: MaterialStateProperty.all(10.0),
            fixedSize: MaterialStateProperty.all(Size(150, 50)),
          ),
        ),
        backgroundColor: CustomColors.secondaryColor,
        scaffoldBackgroundColor: CustomColors.secondaryColor,
        primarySwatch: CustomColors.mainColor,
      ),
      home: const HomePage(title: "Soup Messenger"),
    );
  }
}
