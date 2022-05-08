// To parse this JSON data, do
//
//     final listeningSummary = listeningSummaryFromJson(jsonString);

import 'dart:convert';

List<ListeningSummary> listeningSummaryFromJson(String str) => List<ListeningSummary>.from(json.decode(str).map((x) => ListeningSummary.fromJson(x)));

String listeningSummaryToJson(List<ListeningSummary> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListeningSummary {
    ListeningSummary({
      this.totalq1Lvl1,
      this.totalq1Lvl2,
      this.totalq1Lvl3,
      this.totalq2Lvl1,
      this.totalq2Lvl2,
      this.totalq2Lvl3,
      this.totalq3Lvl1,
      this.totalq3Lvl2,
      this.totalq3Lvl3,
      this.totalq4Lvl1,
      this.totalq4Lvl2,
      this.totalq4Lvl3,
    });

    int? totalq1Lvl1;
    int? totalq1Lvl2;
    int? totalq1Lvl3;
    int? totalq2Lvl1;
    int? totalq2Lvl2;
    int? totalq2Lvl3;
    int? totalq3Lvl1;
    int? totalq3Lvl2;
    int? totalq3Lvl3;
    int? totalq4Lvl1;
    int? totalq4Lvl2;
    int? totalq4Lvl3;

    factory ListeningSummary.fromJson(Map<String, dynamic> json) => ListeningSummary(
        totalq1Lvl1: json["totalq1lvl1"],
        totalq1Lvl2: json["totalq1lvl2"],
        totalq1Lvl3: json["totalq1lvl3"],
        totalq2Lvl1: json["totalq2lvl1"],
        totalq2Lvl2: json["totalq2lvl2"],
        totalq2Lvl3: json["totalq2lvl3"],
        totalq3Lvl1: json["totalq3lvl1"],
        totalq3Lvl2: json["totalq3lvl2"],
        totalq3Lvl3: json["totalq3lvl3"],
        totalq4Lvl1: json["totalq4lvl1"],
        totalq4Lvl2: json["totalq4lvl2"],
        totalq4Lvl3: json["totalq4lvl3"],
    );

    Map<String, dynamic> toJson() => {
        "totalq1lvl1": totalq1Lvl1,
        "totalq1lvl2": totalq1Lvl2,
        "totalq1lvl3": totalq1Lvl3,
        "totalq2lvl1": totalq2Lvl1,
        "totalq2lvl2": totalq2Lvl2,
        "totalq2lvl3": totalq2Lvl3,
        "totalq3lvl1": totalq3Lvl1,
        "totalq3lvl2": totalq3Lvl2,
        "totalq3lvl3": totalq3Lvl3,
        "totalq4lvl1": totalq4Lvl1,
        "totalq4lvl2": totalq4Lvl2,
        "totalq4lvl3": totalq4Lvl3,
    };
}
