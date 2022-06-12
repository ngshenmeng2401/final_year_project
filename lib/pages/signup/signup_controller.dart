import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/user_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{


  late TextEditingController emailController = new TextEditingController();
  late TextEditingController userNameController = new TextEditingController();
  late TextEditingController phoneNoController = new TextEditingController();
  late TextEditingController passwordController = new TextEditingController();
  late TextEditingController confirmPasswordController = new TextEditingController();
  late TextEditingController referralCodeController = new TextEditingController();

  void navigateLoginView(){

    Get.offNamed(AppRoutes.Login);
  }

  void signUpDialog(){

    Get.defaultDialog(
      // title: "Are_you_sure".tr,
      title: "Are you sure",
      content: Column(
        children: [
          Padding(padding: const EdgeInsets.all(0)),
        ],
      ),
      // textConfirm: "Yes".tr,
      // textCancel: "No".tr,
      textConfirm: "Yes",
      textCancel: "No",
      onConfirm: () {
        Get.back();
        checkSignUp();
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void checkSignUp(){

    String email = emailController.text.toString();
    String username = userNameController.text.toString();
    String phoneNo = phoneNoController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();
    String referralCode = referralCodeController.text.toString();

    if(email.isEmpty && username.isEmpty && phoneNo.isEmpty && password.isEmpty && confirmPassword.isEmpty && referralCode.isEmpty){

      Get.snackbar(
        "Error","Please fill in all textfield",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,
      );
    
    }else if (email.isEmpty){

      Get.snackbar(
        "Error","Email is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (username.isEmpty){

      Get.snackbar(
        "Error","Username is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (phoneNo.isEmpty){

      Get.snackbar(
        "Error","Phone No is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (password.isEmpty || confirmPassword.isEmpty){

      Get.snackbar(
        "Error","Password is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (referralCode.isEmpty){

      Get.snackbar(
        "Error","Referral Code is empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if (password!=confirmPassword || confirmPassword!=password){

      Get.snackbar(
        "Error","Both password are different",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else{

      UserRemoteServices.signUpUser(email,username,phoneNo,password,referralCode);
      
    }
  }
}