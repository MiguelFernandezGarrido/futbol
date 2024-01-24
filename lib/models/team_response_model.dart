// To parse this JSON data, do
//
//     final playerResponse = playerResponseFromJson(jsonString);

import 'dart:convert';

import 'package:tema_4/models/player_model.dart';

TeamResponse playerResponseFromJson(String str) =>
    TeamResponse.fromJson(json.decode(str));

class TeamResponse {
  final int? id;
  final String? name;
  final List<Player>? squad;

  TeamResponse({
     this.id,
     this.name,
     this.squad,
  });

  factory TeamResponse.fromJson(Map<String, dynamic> json) => TeamResponse(
        id: json["id"],
        name: json["name"],
        squad: json["squad"] == null
            ? []
            : List<Player>.from(json["squad"].map((x) => Player.fromJson(x))),
      );
}
