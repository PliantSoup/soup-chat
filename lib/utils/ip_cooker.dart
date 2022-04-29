import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

Future<String> get ip async => await Ipify.ipv4();
int get port => 4000;

Future<String> cookIp(String address) async {
  var dividedAddress = address.split(".");
  String cookedIp = '';
  File file = File("C:/Users/Admin/StudioProjects/soup_messenger/assets/FoodList.txt");
  file.readAsLines().then((List<String> lines) {
    cookedIp =
        '${lines[int.parse(dividedAddress[0])]}-${lines[int.parse(dividedAddress[1])]}-${lines[int.parse(dividedAddress[2])]}-${lines[int.parse(dividedAddress[3])]}';
  });
  return cookedIp;
}

Future<String> restoreIp(String cookedIp) async {
  var dividedRecipe = cookedIp.split('-');
  String address = '';
  File file = File("C:/Users/Admin/StudioProjects/soup_messenger/assets/FoodList.txt");
  file.readAsLines().then((List<String> lines) {
    int index0 = lines.indexWhere((element) => element == dividedRecipe[0]);
    int index1 = lines.indexWhere((element) => element == dividedRecipe[1]);
    int index2 = lines.indexWhere((element) => element == dividedRecipe[2]);
    int index3 = lines.indexWhere((element) => element == dividedRecipe[3]);
    address += '$index0.$index1.$index2.$index3';
  });
  return address;
}

Future<List> parseFood() async {
  List<String> wordList = [];

  final response = await http.Client().get(Uri.parse("https://www.enchantedlearning.com/wordlist/food.shtml"));

  if (response.statusCode == 200) {
    var document = parse(response.body);
    var wordsAmount = document.getElementsByClassName("wordlist-item").length;

    for (int i = 0; i < wordsAmount; i++) {
      wordList.add(document.getElementsByClassName("wordlist-item")[i].innerHtml);
    }

    return wordList;
  } else {
    throw Exception();
  }
}

saveFood() async {
  var wordList = await parseFood();
  File file = File("C:/Users/Admin/StudioProjects/soup_messenger/assets/FoodList2.txt");
  for (int i = 0; i < wordList.length; i++) {
    await file.writeAsString('${wordList[i]}\n', mode: FileMode.append);
  }
}
