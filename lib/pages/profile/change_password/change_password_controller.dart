import 'package:final_year_project/service/user_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordController extends GetxController{

  TextEditingController currentPasswordController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  var isTyping = false.obs;

  final appData = GetStorage();

  @override
  void onInit() {
    checkForm();
    super.onInit();
  }

  void checkForm(){

    String password = passwordController.text.toString();
    String confirmPassword = confirmPasswordController.text.toString();

    if(password != confirmPassword || confirmPassword != password ){

      isTyping.value = false;

    }else if(currentPasswordController.text.isEmpty || passwordController.text.isEmpty || confirmPasswordController.text.isEmpty ){

      isTyping.value = false;
    }else{
      isTyping.value = true;
    }
  }

  void changePasswordDialog(){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        changePassword(),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void changePassword(){

    String email = appData.read("keepLogin")??'';
    String currentPassword = currentPasswordController.text.toString();
    String password = passwordController.text.toString();
    String confirmPassword = currentPasswordController.text.toString();

    UserRemoteServices.changePassword(email, currentPassword, password);
  }
}