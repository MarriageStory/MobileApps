import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:wedding_planner/const/strings.dart';

class PaymentDetailService {
  static Future<bool> createNewPaymentDetail(
      int idPayment, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    var paymentDetail = <String, dynamic>{
      "nama_payment": data["nama_payment"],
      "bayar": data["bayar"],
      "tanggal": data["tanggal"],
      "detail": data["detail"],
    };

    var response = await http.post(
        Uri.parse(baseURLAPI + "payments/" + idPayment.toString()),
        body: jsonEncode(paymentDetail),
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
}
