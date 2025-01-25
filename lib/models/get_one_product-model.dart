// To parse this JSON data, do
//
//     final getOneProductModel = getOneProductModelFromJson(jsonString);

import 'dart:convert';

GetOneProductModel getOneProductModelFromJson(String str) => GetOneProductModel.fromJson(json.decode(str));

String getOneProductModelToJson(GetOneProductModel data) => json.encode(data.toJson());

class GetOneProductModel {
  String? code;
  String? message;
  OneData? data;

  GetOneProductModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetOneProductModel.fromJson(Map<String, dynamic> json) => GetOneProductModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? null : OneData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class OneData {
  int? productid;
  String? nameproduct;
  String? priceproduct;
  String? typeofproduct;
  int? quantity;
  String? imagePath;

  OneData({
    this.productid,
    this.nameproduct,
    this.priceproduct,
    this.typeofproduct,
    this.quantity,
    this.imagePath,
  });

  factory OneData.fromJson(Map<String, dynamic> json) => OneData(
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
