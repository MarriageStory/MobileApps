import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/const/strings.dart';
import 'package:wedding_planner/model/schedule_model.dart';
import 'package:http/http.dart' as http;

class ScheduleService {
  static Future<SchedulesModel> getAllSchedules() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response =
        await http.get(Uri.parse(baseURLAPI + "schedules"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return SchedulesModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> createNewSchedule(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var schedule = <String, dynamic>{
      "nama_kegiatan": data["nama_kegiatan"],
      "detail_kegiatan": data["detail_kegiatan"],
      "tanggal": data["tanggal"],
      "tempat": data["tempat"],
      "nama_client": data["nama_client"],
      "jam": data["jam"],
      "status": data["status"],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "schedules"),
        body: jsonEncode(schedule),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> updateSchedule(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var schedule = <String, dynamic>{
      "nama_kegiatan": data["nama_kegiatan"],
      "detail_kegiatan": data["detail_kegiatan"],
      "tanggal": data["tanggal"],
      "tempat": data["tempat"],
      "nama_client": data["nama_client"],
      "jam": data["jam"],
      "status": data["status"],
    };

    var response = await http.put(
        Uri.parse(baseURLAPI + "schedules/" + id.toString()),
        body: jsonEncode(schedule),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': "Bearer $token",
        });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> deleteSchedule(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http
        .delete(Uri.parse(baseURLAPI + "schedules/" + id.toString()), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }
}
