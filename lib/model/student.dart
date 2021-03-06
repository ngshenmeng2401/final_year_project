// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
    Student({
        this.id,
        this.name,
        this.studentClass,
        this.age,
        this.parentId,
        this.phoneNo,
    });

    String? id;
    String? name;
    String? studentClass;
    String? age;
    String? parentId;
    String? phoneNo;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        name: json["name"],
        studentClass: json["studentClass"],
        age: json["age"],
        parentId: json["parent_id"],
        phoneNo: json["phone_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "studentClass": studentClass,
        "age": age,
        "parent_id": parentId,
        "phone_no": phoneNo,
    };
}
