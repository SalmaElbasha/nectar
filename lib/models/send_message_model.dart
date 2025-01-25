// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) => SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) => json.encode(data.toJson());

class SendMessageModel {
  int? senderId;
  int? receiverId;
  String? content;
  Receiver? sender;
  Receiver? receiver;
  DateTime? timestamp;
  bool? read;

  SendMessageModel({
    this.senderId,
    this.receiverId,
    this.content,
    this.sender,
    this.receiver,
    this.timestamp,
    this.read,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) => SendMessageModel(
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    content: json["content"],
    sender: json["sender"] == null ? null : Receiver.fromJson(json["sender"]),
    receiver: json["receiver"] == null ? null : Receiver.fromJson(json["receiver"]),
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    read: json["read"],
  );

  Map<String, dynamic> toJson() => {
    "senderId": senderId,
    "receiverId": receiverId,
    "content": content,
    "sender": sender?.toJson(),
    "receiver": receiver?.toJson(),
    "timestamp": timestamp?.toIso8601String(),
    "read": read,
  };
}

class Receiver {
  int? id;
  String? username;
  String? password;
  String? email;
  String? photoPath;

  Receiver({
    this.id,
    this.username,
    this.password,
    this.email,
    this.photoPath,
  });

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    email: json["email"],
    photoPath: json["photoPath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "email": email,
    "photoPath": photoPath,
  };
}
