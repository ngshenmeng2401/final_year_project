// To parse this JSON data, do
//
//     final testReocrd = testReocrdFromJson(jsonString);

import 'dart:convert';

List<TestReocrd> testReocrdFromJson(String str) => List<TestReocrd>.from(json.decode(str).map((x) => TestReocrd.fromJson(x)));

String testReocrdToJson(List<TestReocrd> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestReocrd {
    TestReocrd({
        this.testId,
        this.code,
        this.lvlCtrl,
        this.previousTestDate,
        this.lastTestDate,
        this.id,
        this.name,
        this.studentClass,
        this.age,
    });

    String? testId;
    String? code;
    String? lvlCtrl;
    String? previousTestDate;
    String? lastTestDate;
    String? id;
    String? name;
    String? studentClass;
    String? age;

    factory TestReocrd.fromJson(Map<String, dynamic> json) => TestReocrd(
        testId: json["test_id"],
        code: json["code"],
        lvlCtrl: json["lvl_ctrl"],
        previousTestDate: json["previous_test_date"],
        lastTestDate: json["last_test_date"],
        id: json["id"],
        name: json["name"],
        studentClass: json["studentClass"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "test_id": testId,
        "code": code,
        "lvl_ctrl": lvlCtrl,
        "previous_test_date": previousTestDate,
        "last_test_date": previousTestDate,
        "id": id,
        "name": name,
        "studentClass": studentClass,
        "age": age,
    };
}
