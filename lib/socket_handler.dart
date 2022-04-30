import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:soup_messenger/utils/ip_cooker.dart' as IPCooker;
import 'package:soup_messenger/utils/message_converter.dart';

class SocketHandler {
  final TextEditingController ip = TextEditingController();
  final TextEditingController port = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController msg = TextEditingController();

  late ServerSocket server;
  late Socket socket;
  late Socket clientSocket;

  //final VoidCallback callback;
  final Function(String, String) callback;

  SocketHandler({Key? key, required this.callback});

  static void initState() async {}
  void startServer() async {
    print("Starting server");
    server = await ServerSocket.bind(InternetAddress.anyIPv4, IPCooker.port);
    server.listen((client) => handleConnection(client));
  }

  void handleConnection(Socket client) {
    print('Connection from ${client.remoteAddress.address}:${client.remotePort}');
    clientSocket = client;

    client.listen(
      (Uint8List data) async {
        final clientResponse = String.fromCharCodes(data);
        final json = messageConverterFromJson(clientResponse);
        callback(json.sender, json.message);
        print(json.message);
      },
      onError: (error) {
        print(error);
        client.close();
      },
      onDone: () {
        print("Client left");
        client.close();
      },
    );
  }

  Future<Socket> connectServer(String address) async {
    socket = await Socket.connect(address, IPCooker.port);
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        final json = messageConverterFromJson(serverResponse);
        callback(json.sender, json.message);
        print(json.message);
      },
      onError: (error) {
        print(error);
        socket.destroy();
      },
      onDone: () {
        print('Disconnected');
        socket.destroy();
      },
    );
    return socket;
  }

  Future<void> returnMessage(String sender, String message) async {
    final json = messageConverterToJson(MessageConverter(message: message, sender: sender));

    clientSocket.write(json);
    callback(sender, message);
  }

  Future<void> sendMessage(String sender, String message) async {
    final json = messageConverterToJson(MessageConverter(message: message, sender: sender));

    socket.write(json);
    callback(sender, message);
  }
}
