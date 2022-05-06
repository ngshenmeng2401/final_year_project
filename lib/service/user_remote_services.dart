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
    if (response.statusCode == 200) {
      var resp = response.body;
      
      Get.snackbar(
        "Register_Successful","Please_check_your_email_to_activate_your_account.",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      return resp;
    } else {
      // show error message
      Get.snackbar(
        "Register_Failed","Please check your input value..",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
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

         Get.snackbar(
          "Login_Failed","Please check your input value..",
          backgroundColor: Colors.white60,
          colorText: Colors.black,
          icon: Icon(Icons.error, color: Colors.black),
          snackPosition: SnackPosition.TOP,  
        );
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

      if(position == "Parent"){

        Get.offNamed(AppRoutes.ParentBottomNavigation);

      }else if(position == "Teacher"){

        Get.offNamed(AppRoutes.TeacherBottomNavigation);

      }else if(position == "Staff"){

        Get.offNamed(AppRoutes.TeacherBottomNavigation);
      }

      Get.snackbar(
        "Login Success","Welcome To Tassneem E Score",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else {

      Get.snackbar(
        "Error","Please_enter_your_email_and_password",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }

  }
}