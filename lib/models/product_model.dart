// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? code;
  String? message;
  List<Datum>? data;

  ProductModel({
    this.code,
    this.message,
    this.data,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
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
