// To parse this JSON data, do
//
//     final childrenTestRecord = childrenTestRecordFromJson(jsonString);

import 'dart:convert';

List<ChildrenTestRecord> childrenTestRecordFromJson(String str) => List<ChildrenTestRecord>.from(json.decode(str).map((x) => ChildrenTestRecord.fromJson(x)));

String childrenTestRecordToJson(List<ChildrenTestRecord> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildrenTestRecord {
    ChildrenTestRecord({
        this.studentId,
        this.testId,
        this.code,
        this.lvlCtrl,
        this.previousTestDate,
        this.lastTestDate,
        this.name,
        this.studentClass,
    });

    String? studentId;
    String? testId;
    String? code;
    String? lvlCtrl;
    String? previousTestDate;
    String? lastTestDate;
    String? name;
    String? studentClass;
    String? age;

    factory ChildrenTestRecord.fromJson(Map<String, dynamic> json) => ChildrenTestRecord(
        studentId: json["student_id"],
        testId: json["test_id"],
        code: json["code"],
        lvlCtrl: json["lvl_ctrl"],
        previousTestDate: json["previous_test_date"],
        lastTestDate: json["last_test_date"],
        name: json["name"],
        studentClass: json["studentClass"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "test_id": testId,
        "code": code,
        "lvl_ctrl": lvlCtrl,
        "previous_test_date": previousTestDate,
        "last_test_date": lastTestDate,
        "name": name,
        "studentClass": studentClass,
    };
}
