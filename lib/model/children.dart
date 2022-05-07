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
        this.listeningresult,
        this.readingresult,
        this.speakingresult,
        this.writingresult,
    });

    String? studentId;
    String? name;
    String? studentClass;
    String? age;
    String? listeningresult;
    String? readingresult;
    String? speakingresult;
    String? writingresult;

    factory Children.fromJson(Map<String, dynamic> json) => Children(
        studentId: json["student_id"],
        name: json["name"],
        studentClass: json["studentClass"],
        age: json["age"],
        listeningresult: json["listeningresult"],
        readingresult: json["readingresult"],
        speakingresult: json["speakingresult"],
        writingresult: json["writingresult"],
    );

    Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "name": name,
        "studentClass": studentClass,
        "age": age,
        "listeningresult": listeningresult,
        "readingresult": readingresult,
        "speakingresult": speakingresult,
        "writingresult": writingresult,
    };
}
