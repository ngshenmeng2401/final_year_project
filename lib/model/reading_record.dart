// To parse this JSON data, do
//
//     final readingRecord = readingRecordFromJson(jsonString);

import 'dart:convert';

List<ReadingRecord> readingRecordFromJson(String str) => List<ReadingRecord>.from(json.decode(str).map((x) => ReadingRecord.fromJson(x)));

String readingRecordToJson(List<ReadingRecord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadingRecord {
    ReadingRecord({
        this.id,
        this.name,
        this.rqId,
        this.rq1,
        this.rq2,
        this.rq3,
        this.rq4,
        this.seenstatus,
    });

    String? id;
    String? name;
    String? rqId;
    String? rq1;
    String? rq2;
    String? rq3;
    String? rq4;
    String? seenstatus;

    factory ReadingRecord.fromJson(Map<String, dynamic> json) => ReadingRecord(
        id: json["id"],
        name: json["name"],
        rqId: json["rq_id"],
        rq1: json["rq1"],
        rq2: json["rq2"],
        rq3: json["rq3"],
        rq4: json["rq4"],
        seenstatus: json["seenstatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rq_id": rqId,
        "rq1": rq1,
        "rq2": rq2,
        "rq3": rq3,
        "rq4": rq4,
        "seenstatus": seenstatus,
    };
}
