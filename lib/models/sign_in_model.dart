// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  String? code;
  String? message;
  Data? data;

  SignInModel({
    this.code,
    this.message,
    this.data,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? username;
  String? password;
  String? email;
  String?errorMessage;

  Data({
    this.id,
    this.username,
    this.password,
    this.email,
    this.errorMessage

  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    email: json["email"],
      errorMessage:json["errorMessage"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "email": email,
    "errorMessage":errorMessage,
  };
}
