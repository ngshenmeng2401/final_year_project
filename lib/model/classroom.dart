// To parse this JSON data, do
//
//     final classroom = classroomFromJson(jsonString);

import 'dart:convert';

List<Classroom> classroomFromJson(String str) => List<Classroom>.from(json.decode(str).map((x) => Classroom.fromJson(x)));

String classroomToJson(List<Classroom> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Classroom {
    Classroom({
        this.classId,
        this.className,
        this.students,
        this.age,
    });

    String? classId;
    String? className;
    String? students;
    String? age;

    factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        classId: json["class_id"],
        className: json["class_name"],
        students: json["students"],
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "class_id": classId,
        "class_name": className,
        "students": students,
        "age": age,
    };
}
