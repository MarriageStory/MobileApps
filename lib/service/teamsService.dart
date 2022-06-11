import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wedding_planner/model/teamsModel.dart';
import 'package:wedding_planner/screens/teams/create_teams.dart';

class TeamsService {
  // static const String _baseUrl = 'http://10.0.2.2:8000/api/';
  // static const String _baseUrl = 'http://192.168.1.5:8000/api/';
  static const String _baseUrl = 'http://192.168.1.31:8000/api/';
  // static const String _baseUrl =
  //     'https://immense-cliffs-78720.herokuapp.com/api/';

  var tokenData = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': "application/json"
  };

  Future<Team> getAllTeams() async {
    final response = await http.get(Uri.parse(_baseUrl + "teams"));
    if (response.statusCode == 200) {
      return Team.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future createTeams(Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse(_baseUrl + "teams"),
        body: body, headers: tokenData);

    try {
      if (response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> deleteTeams(int id) async {
    final response = await http.delete(
        Uri.parse(_baseUrl + "teams/" + id.toString()),
        headers: tokenData);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateTeams(Map<String, dynamic> body, int id) async {
    final response = await http.put(
        Uri.parse(_baseUrl + "teams/" + id.toString()),
        body: body,
        headers: tokenData);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
