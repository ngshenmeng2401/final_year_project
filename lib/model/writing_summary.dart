// To parse this JSON data, do
//
//     final writingSummary = writingSummaryFromJson(jsonString);

import 'dart:convert';

List<WritingSummary> writingSummaryFromJson(String str) => List<WritingSummary>.from(json.decode(str).map((x) => WritingSummary.fromJson(x)));

String writingSummaryToJson(List<WritingSummary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WritingSummary {
    WritingSummary({
        this.totalq1Lvl1,
        this.totalq1Lvl2,
        this.totalq1Lvl3,
        this.totalq2Lvl1,
        this.totalq2Lvl2,
        this.totalq2Lvl3,
    });

    int? totalq1Lvl1;
    int? totalq1Lvl2;
    int? totalq1Lvl3;
    int? totalq2Lvl1;
    int? totalq2Lvl2;
    int? totalq2Lvl3;

    factory WritingSummary.fromJson(Map<String, dynamic> json) => WritingSummary(
        totalq1Lvl1: json["totalq1lvl1"],
        totalq1Lvl2: json["totalq1lvl2"],
        totalq1Lvl3: json["totalq1lvl3"],
        totalq2Lvl1: json["totalq2lvl1"],
        totalq2Lvl2: json["totalq2lvl2"],
        totalq2Lvl3: json["totalq2lvl3"],
    );

    Map<String, dynamic> toJson() => {
        "totalq1lvl1": totalq1Lvl1,
        "totalq1lvl2": totalq1Lvl2,
        "totalq1lvl3": totalq1Lvl3,
        "totalq2lvl1": totalq2Lvl1,
        "totalq2lvl2": totalq2Lvl2,
        "totalq2lvl3": totalq2Lvl3,
    };
}
