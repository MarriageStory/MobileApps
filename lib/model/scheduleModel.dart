// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    required this.data,
  });

  List<Schedules> data;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        data: List<Schedules>.from(
            json["data"].map((x) => Schedules.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Schedules {
  Schedules({
    required this.id,
    required this.namaKegiatan,
    required this.detailKegiatan,
    required this.tanggal,
    required this.jam,
    required this.tempat,
    required this.namaClient,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaKegiatan;
  String detailKegiatan;
  DateTime tanggal;
  String jam;
  String tempat;
  String namaClient;
  DateTime createdAt;
  DateTime updatedAt;

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
        id: json["id"],
        namaKegiatan: json["nama_kegiatan"],
        detailKegiatan: json["detail_kegiatan"],
        tanggal: DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        tempat: json["tempat"],
        namaClient: json["nama_client"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kegiatan": namaKegiatan,
        "detail_kegiatan": detailKegiatan,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "jam": jam,
        "tempat": tempat,
        "nama_client": namaClient,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
