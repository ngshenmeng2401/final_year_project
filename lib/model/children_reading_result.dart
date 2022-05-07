// To parse this JSON data, do
//
//     final childrenReadingResult = childrenReadingResultFromJson(jsonString);

import 'dart:convert';

List<ChildrenReadingResult> childrenReadingResultFromJson(String str) => List<ChildrenReadingResult>.from(json.decode(str).map((x) => ChildrenReadingResult.fromJson(x)));

String childrenReadingResultToJson(List<ChildrenReadingResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildrenReadingResult {
    ChildrenReadingResult({
        this.studentId,
        this.name,
        this.rq1,
        this.rq2,
        this.rq3,
        this.rq4,
    });

    String? studentId;
    String? name;
    String? rq1;
    String? rq2;
    String? rq3;
    String? rq4;

    factory ChildrenReadingResult.fromJson(Map<String, dynamic> json) => ChildrenReadingResult(
        studentId: json["student_id"],
        name: json["name"],
        rq1: json["rq1"],
        rq2: json["rq2"],
        rq3: json["rq3"],
        rq4: json["rq4"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "rq1": rq1,
        "rq2": rq2,
        "rq3": rq3,
        "rq4": rq4,
    };
}
