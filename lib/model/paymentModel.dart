// To parse this JSON data, do
//
//     final payment = paymentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Payment paymentFromJson(String str) => Payment.fromJson(json.decode(str));

String paymentToJson(Payment data) => json.encode(data.toJson());

class Payment {
  Payment({
    required this.data,
  });

  List<payments> data;

  factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        data:
            List<payments>.from(json["data"].map((x) => payments.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class payments {
  payments({
    required this.id,
    required this.namaVendor,
    required this.tunaiKeseluruhan,
    required this.tanggal,
    required this.tunai,
    required this.keterangan,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaVendor;
  String tunaiKeseluruhan;
  DateTime tanggal;
  String tunai;
  String keterangan;
  DateTime createdAt;
  DateTime updatedAt;

  factory payments.fromJson(Map<String, dynamic> json) => payments(
        id: json["id"],
        namaVendor: json["nama_vendor"],
        tunaiKeseluruhan: json["tunai_keseluruhan"],
        tanggal: DateTime.parse(json["tanggal"]),
        tunai: json["tunai"],
        keterangan: json["keterangan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_vendor": namaVendor,
        "tunai_keseluruhan": tunaiKeseluruhan,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "tunai": tunai,
        "keterangan": keterangan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
