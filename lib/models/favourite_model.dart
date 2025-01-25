// To parse this JSON data, do
//
//     final getfavouriteModel = getfavouriteModelFromJson(jsonString);

import 'dart:convert';

GetfavouriteModel getfavouriteModelFromJson(String str) => GetfavouriteModel.fromJson(json.decode(str));

String getfavouriteModelToJson(GetfavouriteModel data) => json.encode(data.toJson());

class GetfavouriteModel {
  String? code;
  String? message;
  List<Datum>? data;

  GetfavouriteModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetfavouriteModel.fromJson(Map<String, dynamic> json) => GetfavouriteModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? productid;
  String? nameproduct;
  String? priceproduct;
  String? typeofproduct;
  int? quantity;
  String? imagePath;

  Datum({
    this.productid,
    this.nameproduct,
    this.priceproduct,
    this.typeofproduct,
    this.quantity,
    this.imagePath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productid: json["productid"],
    nameproduct: json["nameproduct"],
    priceproduct: json["priceproduct"],
    typeofproduct: json["typeofproduct"],
    quantity: json["quantity"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "productid": productid,
    "nameproduct": nameproduct,
    "priceproduct": priceproduct,
    "typeofproduct": typeofproduct,
    "quantity": quantity,
    "imagePath": imagePath,
  };
}
