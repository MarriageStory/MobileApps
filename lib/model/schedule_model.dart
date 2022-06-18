// To parse this JSON data, do
//
//     final schedulesModel = schedulesModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SchedulesModel schedulesModelFromJson(String str) =>
    SchedulesModel.fromJson(json.decode(str));

String schedulesModelToJson(SchedulesModel data) => json.encode(data.toJson());

class SchedulesModel {
  SchedulesModel({
    required this.data,
  });

  List<ScheduleModel> data;

  factory SchedulesModel.fromJson(Map<String, dynamic> json) => SchedulesModel(
        data: List<ScheduleModel>.from(
            json["data"].map((x) => ScheduleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ScheduleModel {
  ScheduleModel({
    required this.id,
    required this.namaKegiatan,
    required this.detailKegiatan,
    required this.tanggal,
    required this.tempat,
    required this.namaClient,
    required this.jam,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaKegiatan;
  String detailKegiatan;
  DateTime tanggal;
  String tempat;
  String namaClient;
  String jam;
  String? status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        id: json["id"],
        namaKegiatan: json["nama_kegiatan"],
        detailKegiatan: json["detail_kegiatan"],
        tanggal: DateTime.parse(json["tanggal"]),
        tempat: json["tempat"],
        namaClient: json["nama_client"],
        jam: json["jam"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kegiatan": namaKegiatan,
        "detail_kegiatan": detailKegiatan,
        "tanggal": tanggal.toIso8601String(),
        "tempat": tempat,
        "nama_client": namaClient,
        "jam": jam,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
