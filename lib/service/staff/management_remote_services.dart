import 'package:final_year_project/model/student.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class StaffManagementRemoteServices{

  static var client = http.Client();
  static final appData = GetStorage();

  //Staff

  static Future<String?> addStudentDetails(String name, String studentClass, String age, String parentId, String phoneNo) async {
    
    print(name);
    print(studentClass);
    print(age);
    print(parentId);
    print(phoneNo);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/add_student.php'), 
      body: {
      "name" : name,
      "studentClass" : studentClass,
      "age" : age,
      "parentId" : parentId,
      "phoneNo" : phoneNo,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Add Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> updateStudentDetails(String id, String oldValue, String newValue, String category) async {
    
    print(newValue);
    print(category);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/edit_student.php'), 
      body: {
        "id" : id,
        "oldValue" : oldValue,
        "newValue" : newValue,
        "category" : category,
      });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Edit Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<String?> deleteStudentDetails(String id, String age, String classRoom) async {
    
    print(id);
    print(classRoom);
    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/delete_student.php'), 
      body: {
        "id" : id,
        "age" : age,
        "classRoom" : classRoom,
      });
    print(response.body);
    if (response.body == "success") {
      var resp = response.body;
      
      getSnackBar("Delete Successful", "");

      return resp;
    } else {
      // show error message
      getSnackBar("Delete Failed", "Please check your input value.");
      return null;
    }
  }

  //Parent

  static Future<String?> addChildren(String studentId, String parentId, String phoneNo) async {
    
    String email = appData.read("keepLogin")??'';

    print(email);
    print(studentId);
    print(parentId);
    print(phoneNo);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/parent_add_children.php'), 
      body: {
        "email" : email,
        "studentId" : studentId,
        "parentId" : parentId,
        "phoneNo" : phoneNo,
      });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Add Successful", "");

      return resp;
    }else if (response.body == "WrongParentId") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "Please key in the correct parent id.");

      return resp;
    }else if (response.body == "WrongPhoneNo") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "Please key in the correct phone number.");

      return resp;
    }else if (response.body == "Duplicate") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "The record are already exist.");

      return resp;
    }else if (response.body == "BothWrong") {
      var resp = response.body;
      
      getSnackBar("Add Failed", "Please key in the correct parent id and phone number.");

      return resp;
    }else {
      // show error message
      getSnackBar("Edit Failed", "Please check your input value.");
      return null;
    }
  }

  //Parent & Staff

  static Future<List<Student>?> fetchStudent(String name, String action, String sortValue) async {

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_student2.php"),
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