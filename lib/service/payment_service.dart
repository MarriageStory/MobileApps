import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wedding_planner/const/strings.dart';
import 'package:wedding_planner/model/payment_model.dart';
import 'package:http/http.dart' as http;

class PaymentService {
  static Future<PaymentsModel> getAllPayments() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http.get(Uri.parse(baseURLAPI + "payments"), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': "Bearer $token",
    });

    if (response.statusCode == 200) {
      return PaymentsModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Gagal Terhubung ke Server");
    }
  }

  static Future<bool> createNewPayment(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var payment = <String, dynamic>{
      "nama_client": data["nama_client"],
      "tunai_keseluruhan": data["tunai_keseluruhan"],
      "tanggal": data["tanggal"],
      "status": data["status"],
      "keterangan": data["keterangan"],
    };

    var response = await http.post(Uri.parse(baseURLAPI + "payments"),
        body: jsonEncode(payment),
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

  static Future<bool> updatePayment(int id, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var payment = <String, dynamic>{
      "nama_client": data["nama_client"],
      "tunai_keseluruhan": data["tunai_keseluruhan"],
      "tanggal": data["tanggal"],
      "status": data["status"],
      "keterangan": data["keterangan"],
    };

    var response = await http.put(
        Uri.parse(baseURLAPI + "payments/" + id.toString()),
        body: jsonEncode(payment),
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

  static Future<bool> deletePayment(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var response = await http
        .delete(Uri.parse(baseURLAPI + "payments/" + id.toString()), headers: {
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
