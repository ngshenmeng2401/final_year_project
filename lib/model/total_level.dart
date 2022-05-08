// To parse this JSON data, do
//
//     final totalLevel = totalLevelFromJson(jsonString);

import 'dart:convert';

List<TotalLevel> totalLevelFromJson(String str) => List<TotalLevel>.from(json.decode(str).map((x) => TotalLevel.fromJson(x)));

String totalLevelToJson(List<TotalLevel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TotalLevel {
    TotalLevel({
        this.totallvl1,
        this.totallvl2,
        this.totallvl3,
    });

    int? totallvl1;
    int? totallvl2;
    int? totallvl3;

    factory TotalLevel.fromJson(Map<String, dynamic> json) => TotalLevel(
        totallvl1: json["totallvl1"],
        totallvl2: json["totallvl2"],
        totallvl3: json["totallvl3"],
    );

    Map<String, dynamic> toJson() => {
        "totallvl1": totallvl1,
        "totallvl2": totallvl2,
        "totallvl3": totallvl3,
    };
}
