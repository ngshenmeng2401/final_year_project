import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ParentManagementRemoteServices{

  static var client = http.Client();
  static final appData = GetStorage();

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