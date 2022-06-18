// To parse this JSON data, do
//
//     final testReocrd = testReocrdFromJson(jsonString);

import 'dart:convert';

List<TestRecord> testReocrdFromJson(String str) => List<TestRecord>.from(json.decode(str).map((x) => TestRecord.fromJson(x)));

String testReocrdToJson(List<TestRecord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestRecord {
    TestRecord({
        this.testId,
        this.studentId,
        this.code,
        this.lvlCtrl,
        this.lastTestDate,
        this.name,
        this.studentClass,
    });

    String? testId;
    String? studentId;
    String? code;
    String? lvlCtrl;
    String? lastTestDate;
    String? name;
    String? studentClass;

    factory TestRecord.fromJson(Map<String, dynamic> json) => TestRecord(
        testId: json["test_id"],
        studentId: json["student_id"],
        code: json["code"],
        lvlCtrl: json["lvl_ctrl"],
        lastTestDate: json["last_test_date"],
        name: json["name"],
        studentClass: json["studentClass"],
    );

    Map<String, dynamic> toJson() => {
        "test_id": testId,
        "student_id": studentId,
        "code": code,
        "lvl_ctrl": lvlCtrl,
        "last_test_date": lastTestDate,
        "name": name,
        "studentClass": studentClass,
    };
}
