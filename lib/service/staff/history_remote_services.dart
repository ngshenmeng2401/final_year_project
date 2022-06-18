import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/model/test_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HistoryRemoteServices{

  static var client = http.Client();

  static Future<String?> addTestRecord(String studentId, String code, String lvlCtrl, String lastTestDate) async {
    
    print(studentId);
    print(code);
    print(lvlCtrl);
    print(lastTestDate);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/add_test_record.php'), 
      body: {
      "studentId" : studentId,
      "code" : code,
      "lvlCtrl" : lvlCtrl,
      "lastTestDate" : lastTestDate,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    }else if (response.body == "Duplicate") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "The student id is already in the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Add Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> editTestRecord(String testId, String previousTestDate, String lastTestDate) async {
    
    print(testId);
    print(previousTestDate);
    print(lastTestDate);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/edit_test_record.php'), 
      body: {
      "testId" : testId,
      "previousTestDate" : previousTestDate,
      "lastTestDate" : lastTestDate,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Edit Failed", "Did not found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> deleteTestRecord(String testId) async {
    
    print(testId);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/delete_test_record.php'), 
      body: {
      "testId" : testId,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Edit Failed", "Did not found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<List<Student>?> fetchTestRecord(String name, String action, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_student_testlist.php"),
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
          // print("IN remoteservices" + jsonString);
          return studentFromJson(jsonString);
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