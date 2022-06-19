import 'package:final_year_project/model/children_test_record.dart';
import 'package:final_year_project/model/test_record.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class ParentHistoryRemoteService{

  static var client = http.Client();
  static final appData = GetStorage();

  static Future<List<TestRecord>?> fetchChildrenTestRecord() async {

    String email = appData.read("keepLogin")??'';  

    print(email); 

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_children_test_record.php"),
          body: {
            "email":email,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return testRecordFromJson(jsonString);
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