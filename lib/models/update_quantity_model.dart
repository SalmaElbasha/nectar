// To parse this JSON data, do
//
//     final updateQuantityModel = updateQuantityModelFromJson(jsonString);

import 'dart:convert';

UpdateQuantityModel updateQuantityModelFromJson(String str) => UpdateQuantityModel.fromJson(json.decode(str));

String updateQuantityModelToJson(UpdateQuantityModel data) => json.encode(data.toJson());

class UpdateQuantityModel {
  String? code;
  String? message;
  int? data;

  UpdateQuantityModel({
    this.code,
    this.message,
    this.data,
  });

  factory UpdateQuantityModel.fromJson(Map<String, dynamic> json) => UpdateQuantityModel(
    code: json["code"],
    message: json["message"],
    data: json["data"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data,
  };
}
