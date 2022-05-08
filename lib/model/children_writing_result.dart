// To parse this JSON data, do
//
//     final childrenWritingResult = childrenWritingResultFromJson(jsonString);

import 'dart:convert';

List<ChildrenWritingResult> childrenWritingResultFromJson(String str) => List<ChildrenWritingResult>.from(json.decode(str).map((x) => ChildrenWritingResult.fromJson(x)));

String childrenWritingResultToJson(List<ChildrenWritingResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildrenWritingResult {
    ChildrenWritingResult({
        this.studentId,
        this.name,
        this.writingSeenStatus,
        this.wq1,
        this.wq2,
    });

    String? studentId;
    String? name;
    String? writingSeenStatus;
    String? wq1;
    String? wq2;

    factory ChildrenWritingResult.fromJson(Map<String, dynamic> json) => ChildrenWritingResult(
        studentId: json["student_id"],
        name: json["name"],
        writingSeenStatus: json["writing_seen_status"],
        wq1: json["wq1"],
        wq2: json["wq2"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "writing_seen_status": writingSeenStatus,
        "wq1": wq1,
        "wq2": wq2,
    };
}
