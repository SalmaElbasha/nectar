// To parse this JSON data, do
//
//     final userCartModel = userCartModelFromJson(jsonString);

import 'dart:convert';

UserCartModel userCartModelFromJson(String str) => UserCartModel.fromJson(json.decode(str));

String userCartModelToJson(UserCartModel data) => json.encode(data.toJson());

class UserCartModel {
  String? code;
  String? message;
  Data? data;

  UserCartModel({
    this.code,
    this.message,
    this.data,
  });

  factory UserCartModel.fromJson(Map<String, dynamic> json) => UserCartModel(
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
  Map<String, int>? productQuantities;
  Users? users;
  List<CartItem>? cartItems;

  Data({
    this.id,
    this.productQuantities,
    this.users,
    this.cartItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    productQuantities: Map.from(json["productQuantities"]!).map((k, v) => MapEntry<String, int>(k, v)),
    users: json["users"] == null ? null : Users.fromJson(json["users"]),
    cartItems: json["cartItems"] == null ? [] : List<CartItem>.from(json["cartItems"]!.map((x) => CartItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "productQuantities": Map.from(productQuantities!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "users": users?.toJson(),
    "cartItems": cartItems == null ? [] : List<dynamic>.from(cartItems!.map((x) => x.toJson())),
  };
}

class CartItem {
  int? productid;
  String? nameproduct;
  String? priceproduct;
  String? typeofproduct;
  int? quantity;
  String? imagePath;

  CartItem({
    this.productid,
    this.nameproduct,
    this.priceproduct,
    this.typeofproduct,
    this.quantity,
    this.imagePath,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
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

class Users {
  int? id;
  String? username;
  String? password;
  String? email;

  Users({
    this.id,
    this.username,
    this.password,
    this.email,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    username: json["username"],
    password: json["password"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "password": password,
    "email": email,
  };
}
