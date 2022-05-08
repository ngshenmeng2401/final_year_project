// To parse this JSON data, do
//
//     final childrenListeningResult = childrenListeningResultFromJson(jsonString);

import 'dart:convert';

List<ChildrenListeningResult> childrenListeningResultFromJson(String str) => List<ChildrenListeningResult>.from(json.decode(str).map((x) => ChildrenListeningResult.fromJson(x)));

String childrenListeningResultToJson(List<ChildrenListeningResult> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildrenListeningResult {
    ChildrenListeningResult({
        this.studentId,
        this.listeningSeenStatus,
        this.name,
        this.lq1,
        this.lq2,
        this.lq3,
        this.lq4,
    });

    String? studentId;
    String? listeningSeenStatus;
    String? name;
    String? lq1;
    String? lq2;
    String? lq3;
    String? lq4;

    factory ChildrenListeningResult.fromJson(Map<String, dynamic> json) => ChildrenListeningResult(
        studentId: json["studentId"],
        listeningSeenStatus: json["listening_seen_status"],
        name: json["name"],
        lq1: json["lq1"],
        lq2: json["lq2"],
        lq3: json["lq3"],
        lq4: json["lq4"],
    );

    Map<String, dynamic> toJson() => {
        "studentId": studentId,
        "listening_seen_status": listeningSeenStatus,
        "name": name,
        "lq1": lq1,
        "lq2": lq2,
        "lq3": lq3,
        "lq4": lq4,
    };
}
