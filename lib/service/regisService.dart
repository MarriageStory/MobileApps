import 'package:wedding_planner/model/regisAuth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class regisService {
  // static final String _baseUrl =
  //     'https://immense-cliffs-78720.herokuapp.com/api/';
  static const String _baseUrl = 'http://192.168.1.59:8000/api/';

  Future register() async {
    final response = await http.post(Uri.parse(_baseUrl + "regis"));

    try {
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ("gagal regis");
      }
    } catch (e) {
      print("Terjadi kesalahan");
    }
  }
}
