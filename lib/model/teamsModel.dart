// To parse this JSON data, do
//
//     final teams = teamsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Team teamsFromJson(String str) => Team.fromJson(json.decode(str));

String teamsToJson(Team data) => json.encode(data.toJson());

class Team {
  Team({
    required this.data,
  });

  List<Teams> data;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        data: List<Teams>.from(json["data"].map((x) => Teams.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Teams {
  Teams({
    required this.id,
    required this.leader,
    required this.staf,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String leader;
  String staf;
  DateTime createdAt;
  DateTime updatedAt;

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        id: json["id"],
        leader: json["leader"],
        staf: json["staf"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "leader": leader,
        "staf": staf,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
