// To parse this JSON data, do
//
//     final searchProductModel = searchProductModelFromJson(jsonString);

import 'dart:convert';

SearchProductModel searchProductModelFromJson(String str) => SearchProductModel.fromJson(json.decode(str));

String searchProductModelToJson(SearchProductModel data) => json.encode(data.toJson());

class SearchProductModel {
  String? code;
  String? message;
  List<SearchDatum>? data;

  SearchProductModel({
    this.code,
    this.message,
    this.data,
  });

  factory SearchProductModel.fromJson(Map<String, dynamic> json) => SearchProductModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? [] : List<SearchDatum>.from(json["data"]!.map((x) => SearchDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SearchDatum {
  int? productid;
  String? nameproduct;
  String? priceproduct;
  String? typeofproduct;
  int? quantity;
  String? imagePath;

  SearchDatum({
    this.productid,
    this.nameproduct,
    this.priceproduct,
    this.typeofproduct,
    this.quantity,
    this.imagePath,
  });

  factory SearchDatum.fromJson(Map<String, dynamic> json) => SearchDatum(
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
