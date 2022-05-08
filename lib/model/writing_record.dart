// To parse this JSON data, do
//
//     final writingRecord = writingRecordFromJson(jsonString);

import 'dart:convert';

List<WritingRecord> writingRecordFromJson(String str) => List<WritingRecord>.from(json.decode(str).map((x) => WritingRecord.fromJson(x)));

String writingRecordToJson(List<WritingRecord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WritingRecord {
    WritingRecord({
        this.id,
        this.name,
        this.wqId,
        this.wq1,
        this.wq2,
        this.writingSeenStatus,
    });

    String? id;
    String? name;
    String? wqId;
    String? wq1;
    String? wq2;
    String? writingSeenStatus;

    factory WritingRecord.fromJson(Map<String, dynamic> json) => WritingRecord(
        id: json["id"],
        name: json["name"],
        wqId: json["wq_id"],
        wq1: json["wq1"],
        wq2: json["wq2"],
        writingSeenStatus: json["writing_seen_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "wq_id": wqId,
        "wq1": wq1,
        "wq2": wq2,
        "writing_seen_status": writingSeenStatus,
    };
}
