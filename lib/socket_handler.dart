import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:soup_messenger/utils/ip_cooker.dart' as GetIP;

class SocketHandler {
  final TextEditingController ip = TextEditingController();
  final TextEditingController port = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController msg = TextEditingController();

  late ServerSocket server;
  late Socket socket;
  late Socket clientSocket;

  //final VoidCallback callback;
  final Function(String) callback;

  SocketHandler({Key? key, required this.callback});

  static void initState() async {}
  void startServer() async {
    print("Starting server");
    server = await ServerSocket.bind(InternetAddress.anyIPv4, GetIP.port());
    server.listen((client) => handleConnection(client));
  }

  void handleConnection(Socket client) {
    print('Connection from ${client.remoteAddress.address}:${client.remotePort}');
    clientSocket = client;

    client.listen(
      (Uint8List data) async {
        final message = String.fromCharCodes(data);
        callback(message);
        print(message);
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
    socket = await Socket.connect(address, GetIP.port());
    print('Connected to: ${socket.remoteAddress.address}:${socket.remotePort}');

    socket.listen(
      (Uint8List data) {
        final serverResponse = String.fromCharCodes(data);
        callback(serverResponse);
        print(serverResponse);
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

  Future<void> returnMessage(String message) async {
    clientSocket.write(message);
    callback(message);
  }

  Future<void> sendMessage(String message) async {
    socket.write(message);
    callback(message);
  }
}
