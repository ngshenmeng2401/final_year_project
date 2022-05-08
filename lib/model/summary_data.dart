// To parse this JSON data, do
//
//     final summaryData = summaryDataFromJson(jsonString);

import 'dart:convert';

List<SummaryData> summaryDataFromJson(String str) => List<SummaryData>.from(json.decode(str).map((x) => SummaryData.fromJson(x)));

String summaryDataToJson(List<SummaryData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SummaryData {
    SummaryData({
        this.totalstudent,
        this.totalclass,
        this.totalrecord,
        this.totalparent,
    });

    int? totalstudent;
    int? totalclass;
    int? totalrecord;
    int? totalparent;

    factory SummaryData.fromJson(Map<String, dynamic> json) => SummaryData(
        totalstudent: json["totalstudent"],
        totalclass: json["totalclass"],
        totalrecord: json["totalrecord"],
        totalparent: json["totalparent"],
    );

    Map<String, dynamic> toJson() => {
        "totalstudent": totalstudent,
        "totalclass": totalclass,
        "totalrecord": totalrecord,
        "totalparent": totalparent,
    };
}
