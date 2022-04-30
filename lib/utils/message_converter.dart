import 'dart:convert';

MessageConverter messageConverterFromJson(String str) => MessageConverter.fromJson(json.decode(str));

String messageConverterToJson(MessageConverter data) => json.encode(data.toJson());

class MessageConverter {
  MessageConverter({
    required this.message,
    required this.sender,
  });

  String message;
  String sender;

  factory MessageConverter.fromJson(Map<String, dynamic> json) => MessageConverter(
        message: json["message"],
        sender: json["sender"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "sender": sender,
      };
}
