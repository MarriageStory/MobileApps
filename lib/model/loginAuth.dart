// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.token,
  });

  String token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
