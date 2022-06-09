// To parse this JSON data, do
//
//     final Payment = PaymentFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Payment PaymentFromJson(String str) => Payment.fromJson(json.decode(str));

String PaymentToJson(Payment data) => json.encode(data.toJson());

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
    required this.namaClient,
    required this.tunaiKeseluruhan,
    required this.tanggal,
    required this.terbayar,
    required this.keterangan,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaClient;
  String tunaiKeseluruhan;
  DateTime tanggal;
  String terbayar;
  String keterangan;
  DateTime createdAt;
  DateTime updatedAt;

  factory payments.fromJson(Map<String, dynamic> json) => payments(
        id: json["id"],
        namaClient: json["nama_client"],
        tunaiKeseluruhan: json["tunai_keseluruhan"],
        tanggal: DateTime.parse(json["tanggal"]),
        terbayar: json["terbayar"],
        keterangan: json["keterangan"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_client": namaClient,
        "tunai_keseluruhan": tunaiKeseluruhan,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "terbayar": terbayar,
        "keterangan": keterangan,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
