import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wedding_planner/model/getUserAuth.dart';
import 'package:http/http.dart' as http;

class getUsers {
  // static final String _baseUrl =
  //     'https://immense-cliffs-78720.herokuapp.com/api/';
  static const String _baseUrl = 'http://192.168.1.59:8000/api/';

  Future<User> GetUser() async {
    final response = await http.get(Uri.parse(_baseUrl + "user"));

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed ');
    }
  }
}
