import 'package:final_year_project/model/children.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ParentHomeRemoteServices{

  static var client = http.Client();
  static final appData = GetStorage();

  static Future<String?> deleteRecord(String studentId) async {

    String email = appData.read("keepLogin")??'';
    
    print(studentId);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/delete_children.php'), 
      body: {
      "email" : email,
      "studentId" : studentId,
    });
    print(response.body);
    if (response.body == "Success") {
      var resp = response.body;
      
      getSnackBar("Delete Successful", "");

      return resp;
    }else if (response.body == "NotFound") {
      var resp = response.body;
      
      getSnackBar("Delete Failed", "Can't found the record");

      return resp;
    } else {
      // show error message
      getSnackBar("Delete Failed", "Please check your input value.");
      return null;
    }
  }

  static Future<List<Children>?> fetchChildren(String name, String action) async {

    String email = appData.read("keepLogin")??'';

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_children.php"),
          body: {
            "email":email,
            "action" : action,
            "name" : name,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return childrenFromJson(jsonString);
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