import 'package:final_year_project/model/classroom.dart';
import 'package:final_year_project/model/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeRemoteServices{

  static var client = http.Client();

  static Future<List<Student>?> fetchStudentWithClass(String className) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/final_year_project/load_student_with_class.php"),
          body: {
            "className":className,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return studentFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<List<Classroom>?> fetchClassroom(String name, String action, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://javathree99.com/s271059/final_year_project/load_classroom.php"),
          body: {
            "name":name,
            "action" : action,
            "sortValue" : sortValue,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return classroomFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static void getSnackBar(String title, String subtitle){

    Get.snackbar(
      title,subtitle,
      backgroundColor: Colors.white60,
      colorText: Colors.black,
      icon: const Icon(Icons.error, color: Colors.black),
      snackPosition: SnackPosition.TOP,  
    );
  }
}