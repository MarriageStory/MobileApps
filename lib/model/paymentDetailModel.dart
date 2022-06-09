// To parse this JSON data, do
//
//     final PaymentDetail = PaymentDetailFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PaymentDetail PaymentDetailFromJson(String str) =>
    PaymentDetail.fromJson(json.decode(str));

String PaymentDetailToJson(PaymentDetail data) => json.encode(data.toJson());

class PaymentDetail {
  PaymentDetail({
    required this.data,
  });

  List<PaymentDetails> data;

  factory PaymentDetail.fromJson(Map<String, dynamic> json) => PaymentDetail(
        data: List<PaymentDetails>.from(
            json["data"].map((x) => PaymentDetails.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class PaymentDetails {
  PaymentDetails({
    required this.id,
    required this.paymentFor,
    required this.bayar,
    required this.tanggal,
    required this.detail,
    required this.idPayment,
    required this.jam,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String paymentFor;
  String bayar;
  DateTime tanggal;
  String detail;
  int idPayment;
  String jam;
  DateTime createdAt;
  DateTime updatedAt;

  factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
        id: json["id"],
        paymentFor: json["payment_for"],
        bayar: json["bayar"],
        tanggal: DateTime.parse(json["tanggal"]),
        detail: json["detail"],
        idPayment: json["id_payment"],
        jam: json["jam"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "payment_for": paymentFor,
        "bayar": bayar,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "detail": detail,
        "id_payment": idPayment,
        "jam": jam,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
