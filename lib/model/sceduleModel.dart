// To parse this JSON data, do
//
//     final scedule = sceduleFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Scedule sceduleFromJson(String str) => Scedule.fromJson(json.decode(str));

String sceduleToJson(Scedule data) => json.encode(data.toJson());

class Scedule {
  Scedule({
    required this.data,
  });

  List<Scedules> data;

  factory Scedule.fromJson(Map<String, dynamic> json) => Scedule(
        data:
            List<Scedules>.from(json["data"].map((x) => Scedules.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Scedules {
  Scedules({
    required this.id,
    required this.namaKegiatan,
    required this.detailKegiatan,
    required this.tanggal,
    required this.jam,
    required this.tempat,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaKegiatan;
  String detailKegiatan;
  DateTime tanggal;
  String jam;
  String tempat;
  DateTime createdAt;
  DateTime updatedAt;

  factory Scedules.fromJson(Map<String, dynamic> json) => Scedules(
        id: json["id"],
        namaKegiatan: json["nama_kegiatan"],
        detailKegiatan: json["detail_kegiatan"],
        tanggal: DateTime.parse(json["tanggal"]),
        jam: json["jam"],
        tempat: json["tempat"],
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
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
