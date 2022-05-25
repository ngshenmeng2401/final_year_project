// To parse this JSON data, do
//
//     final speakingRecord = speakingRecordFromJson(jsonString);

import 'dart:convert';

List<SpeakingRecord> speakingRecordFromJson(String str) => List<SpeakingRecord>.from(json.decode(str).map((x) => SpeakingRecord.fromJson(x)));

String speakingRecordToJson(List<SpeakingRecord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SpeakingRecord {
    SpeakingRecord({
        this.id,
        this.name,
        this.sqId,
        this.sq1,
        this.sq2,
        this.sq3,
        this.sq4,
        this.sq5,
        this.seenstatus,
    });

    String? id;
    String? name;
    String? sqId;
    String? sq1;
    String? sq2;
    String? sq3;
    String? sq4;
    String? sq5;
    String? seenstatus;

    factory SpeakingRecord.fromJson(Map<String, dynamic> json) => SpeakingRecord(
        id: json["id"],
        name: json["name"],
        sqId: json["sq_id"],
        sq1: json["sq1"],
        sq2: json["sq2"],
        sq3: json["sq3"],
        sq4: json["sq4"],
        sq5: json["sq5"],
        seenstatus: json["seenstatus"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sq_id": sqId,
        "sq1": sq1,
        "sq2": sq2,
        "sq3": sq3,
        "sq4": sq4,
        "sq5": sq5,
        "seenstatus": seenstatus,
    };
}
