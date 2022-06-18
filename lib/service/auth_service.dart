import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/const/strings.dart';
import 'package:wedding_planner/model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planner/model/user_model.dart';

class AuthService {
  static Future authRegister(Map<String, dynamic> data) async {
    final response = await http.post(Uri.parse(baseURLAPI + "register"),
        headers: {
          'content-Type': 'aplication/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': data["name"]!,
          'email': data["email"]!,
          'password': data["password"]!,
        }));

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<LoginModel> authLogin(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();

    var dataLogin = <String, dynamic>{
      'email': data['email'],
      'password': data['password'],
    };

    var response =  await http.post(Uri.parse(baseURLAPI + "login"),
        body: jsonEncode(<String, dynamic>{
          'email': data["email"],
          'password': data["password"],
        }),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        });
    if (response.statusCode == 200) {
      Map<dynamic, dynamic> temp = jsonDecode(response.body);
      await prefs.setString('token', temp['access_token']);
      return LoginModel.fromJson(jsonDecode(response.body));
    } else {
      return LoginModel.fromJson(jsonDecode(response.body));
    }
  }

  static Future<UserModel> authUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http.get(Uri.parse(baseURLAPI + "user"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      return UserModel.fromJson(jsonDecode(response.body));
    }
  }
}
