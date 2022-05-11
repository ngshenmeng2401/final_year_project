// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.userName,
        this.phoneNo,
        this.status,
        this.imgStatus,
    });

    String? userName;
    String? phoneNo;
    String? status;
    String? imgStatus;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["user_name"],
        phoneNo: json["phone_no"],
        status: json["status"],
        imgStatus: json["img_status"],
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName,
        "phone_no": phoneNo,
        "status": status,
        "img_status": imgStatus,
    };
}
