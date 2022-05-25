import 'package:final_year_project/model/user.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class UserRemoteServices {

  static var client = http.Client();
  static final appData = GetStorage();

  static Future<String?> signUpUser(String email, String username , String phoneNo, String password, String referralCode) async {

    print(email);
    print(username);
    print(phoneNo);
    print(password);
    print(referralCode);
    
    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/signup_user.php'), 
      body: {
      "email" : email,
      "username" : username,
      "phoneNo" : phoneNo,
      "password" : password,
      "referralCode" : referralCode,
    });
    print(response.body);
    if (response.body == "Success"){
        var resp = response.body;
      
        getSnackBar("Register Successful", "Please check your email to activate your account");
        
        return resp;

    }else {
      // show error message
      getSnackBar("Register Failed", "Please check your input value.");
      return null;
      // throw Exception("Error");
    }
  }

  static Future<String?> loginUser(String email, String password, String position) async {

    print(email);
    print(password);
    print(position);

    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/login_user.php'), 
      body: {
      "email" : email,
      "password" : password,
      "position" : position,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var resp = response.body;
      if (response.body == "failed"){

        getSnackBar("Login Failed", "Please check your input value.");

      }else{

        checkLogin(email, password, position);
      }
      return resp;
    } else {

      //show error message
      return null;
    }
  }

  static void checkLogin(String email, String password, String position) {

    if(email != "" && password != ""){
      print("Sucessful");

      appData.write("isLogged", true);
      appData.write("keepLogin", email);
      appData.write("position", position);

      if(position == "Parent"){

        Get.offNamed(AppRoutes.ParentBottomNavigation);

      }else if(position == "Staff"){

        Get.offNamed(AppRoutes.TeacherBottomNavigation);
      }

      getSnackBar("Login Success", "Welcome To E-Tas");

    }else {
      getSnackBar("Error", "Please enter your email and password");
    }

  }

  static Future<List<User>?> fetchUserDetails() async {

    String email = appData.read("keepLogin")??'';

    var response =
      await client.post(
        Uri.parse(
          "https://hubbuddies.com/271059/final_year_project/load_user.php"),
          body: {
            "email":email,
          });
      if (response.statusCode == 200) {
        if (response.body == "nodata") {
          return null;
        } else {
          var jsonString = response.body;
          print("IN remoteservices" + jsonString);
          return userFromJson(jsonString);
        }
      } else {
        //show error message
        // return null;
        throw Exception('Failed to load Categories from API');
      }
  }

  static Future<String?> changePassword(String email, String currentPassword , String password) async {

    print(email);
    print(currentPassword);
    print(password);
    
    var response = await client.post(

      Uri.parse('https://hubbuddies.com/271059/final_year_project/change_password.php'), 
      body: {
      "email" : email,
      "currentPassword" : currentPassword,
      "password" : password,
    });
    print(response.body);
    if (response.body == "Success"){
        var resp = response.body;
      
        getSnackBar("Change Successful", "");
        
        return resp;

    }else if (response.body == "NotFound"){
        var resp = response.body;
      
        getSnackBar("Not found the record", "");
        
        return resp;

    }else if (response.body == "WrongCurrentPassword"){
        var resp = response.body;
      
        getSnackBar("Current password is wrong", "");
        
        return resp;

    }else {
      // show error message
      getSnackBar("Change Failed", "Please check your input value.");
      return null;
      // throw Exception("Error");
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