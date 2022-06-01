import 'dart:convert';
import 'package:wedding_planner/model/loginAuth.dart';
import 'package:http/http.dart' as http;

class loginService {
  static final String _baseUrl =
      'https://immense-cliffs-78720.herokuapp.com/api/';

  Future logins() async {
    final response = await http.post(Uri.parse(_baseUrl + "login"));

    try {
      if (response.statusCode == 200) {
        return true;
      } else {
        throw ("failed to login");
      }
    } catch (e) {
      print("Terjadi kesalahan");
    }
  }
}
