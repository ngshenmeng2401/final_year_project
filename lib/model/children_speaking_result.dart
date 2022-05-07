// To parse this JSON data, do
//
//     final childrenSpeakingResult = childrenSpeakingResultFromJson(jsonString);

import 'dart:convert';

List<ChildrenSpeakingResult> childrenSpeakingResultFromJson(String str) => List<ChildrenSpeakingResult>.from(json.decode(str).map((x) => ChildrenSpeakingResult.fromJson(x)));

String childrenSpeakingResultToJson(List<ChildrenSpeakingResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildrenSpeakingResult {
    ChildrenSpeakingResult({
        this.studentId,
        this.name,
        this.sq1,
        this.sq2,
        this.sq3,
        this.sq4,
        this.sq5,
    });

    String? studentId;
    String? name;
    String? sq1;
    String? sq2;
    String? sq3;
    String? sq4;
    String? sq5;

    factory ChildrenSpeakingResult.fromJson(Map<String, dynamic> json) => ChildrenSpeakingResult(
        studentId: json["student_id"],
        name: json["name"],
        sq1: json["sq1"],
        sq2: json["sq2"],
        sq3: json["sq3"],
        sq4: json["sq4"],
        sq5: json["sq5"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "sq1": sq1,
        "sq2": sq2,
        "sq3": sq3,
        "sq4": sq4,
        "sq5": sq5,
    };
}
