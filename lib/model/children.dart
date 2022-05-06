// To parse this JSON data, do
//
//     final children = childrenFromJson(jsonString);

import 'dart:convert';

List<Children> childrenFromJson(String str) => List<Children>.from(json.decode(str).map((x) => Children.fromJson(x)));

String childrenToJson(List<Children> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Children {
    Children({
        this.studentId,
        this.name,
        this.studentClass,
        this.age,
    });

    String? studentId;
    String? name;
    String? studentClass;
    String? age;

    factory Children.fromJson(Map<String, dynamic> json) => Children(
        studentId: json["student_id"],
        name: json["name"],
        studentClass: json["studentClass"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "studentClass": studentClass,
        "age": age,
    };
}
