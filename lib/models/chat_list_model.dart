// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

import 'dart:convert';

ChatListModel chatListModelFromJson(String str) => ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  String? code;
  String? message;
  List<ChatList>? data;

  ChatListModel({
    this.code,
    this.message,
    this.data,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<ChatList>.from(json["data"]!.map((x) => ChatList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ChatList {
  int? otherUserId;
  dynamic otherUserPhoto;
  String? otherUser;
  String? lastMessage;
  DateTime? timestamp;

  ChatList({
    this.otherUserId,
    this.otherUserPhoto,
    this.otherUser,
    this.lastMessage,
    this.timestamp,
  });

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
    otherUserId: json["otherUserId"],
    otherUserPhoto: json["otherUserPhoto"],
    otherUser: json["otherUser"],
    lastMessage: json["lastMessage"],
    timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
  );

  Map<String, dynamic> toJson() => {
    "otherUserId": otherUserId,
    "otherUserPhoto": otherUserPhoto,
    "otherUser": otherUser,
    "lastMessage": lastMessage,
    "timestamp": timestamp?.toIso8601String(),
  };
}
