// To parse this JSON data, do
//
//     final regis = regisFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Regis regisFromJson(String str) => Regis.fromJson(json.decode(str));

String regisToJson(Regis data) => json.encode(data.toJson());

class Regis {
  Regis({
    required this.user,
    required this.token,
  });

  User user;
  String token;

  factory Regis.fromJson(Map<String, dynamic> json) => Regis(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.name,
    required this.email,
    required this.password,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String name;
  String email;
  String password;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
