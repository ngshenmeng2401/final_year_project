// To parse this JSON data, do
//
//     final listeningRecord = listeningRecordFromJson(jsonString);

import 'dart:convert';

List<ListeningRecord> listeningRecordFromJson(String str) => List<ListeningRecord>.from(json.decode(str).map((x) => ListeningRecord.fromJson(x)));

String listeningRecordToJson(List<ListeningRecord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListeningRecord {
    ListeningRecord({
        this.id,
        this.name,
        this.lqId,
        this.lq1,
        this.lq2,
        this.lq3,
        this.lq4,
        this.listeningSeenStatus,
    });

    String? id;
    String? name;
    String? lqId;
    String? lq1;
    String? lq2;
    String? lq3;
    String? lq4;
    String? listeningSeenStatus;

    factory ListeningRecord.fromJson(Map<String, dynamic> json) => ListeningRecord(
        id: json["id"],
        name: json["name"],
        lqId: json["lq_id"],
        lq1: json["lq1"],
        lq2: json["lq2"],
        lq3: json["lq3"],
        lq4: json["lq4"],
        listeningSeenStatus: json["listening_seen_status"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "lq_id": lqId,
        "lq1": lq1,
        "lq2": lq2,
        "lq3": lq3,
        "lq4": lq4,
        "listening_seen_status": listeningSeenStatus,
    };
}
