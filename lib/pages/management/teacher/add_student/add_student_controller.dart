import 'package:final_year_project/service/teacher_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentDetailsController extends GetxController{

  late TextEditingController studentNameController = new TextEditingController();
  late TextEditingController studentClassController = new TextEditingController();
  late TextEditingController studentAgeController = new TextEditingController();
  late TextEditingController parentIDController = new TextEditingController();
  late TextEditingController phoneNoController = new TextEditingController();

  var isTyping = false.obs;
  var isUnder = false.obs;

  @override
  void onInit() {

    super.onInit();
    checkStudentForm();
    checkParentId();
  }

  void checkParentId(){

    parentIDController.text.length == 12
    ? isUnder.value = true
    : isUnder.value = false;
  }

  void checkStudentForm(){

    if(studentNameController.text.isEmpty || studentClassController.text.isEmpty || studentAgeController.text.isEmpty || parentIDController.text.isEmpty || phoneNoController.text.isEmpty){

      isTyping.value = false;
    }else{
      isTyping.value = true;
    }
  }

  void addStudentDialog(){

    String name = studentNameController.text.toString();
    String studentClass = studentClassController.text.toString();
    String age = studentAgeController.text.toString();
    String parentId = parentIDController.text.toString();
    String phoneNo = phoneNoController.text.toString();

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        addStudentDetails(name, studentClass, age, parentId, phoneNo),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void addStudentDetails(String name, String studentClass, String age, String parentId, String phoneNo){

    if(isTyping.value == false || isUnder.value == false){

      Get.snackbar(
        "Add Failed","Please check your input value",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    }else{

      TeacherRemoteServices.addStudentDetails(name, studentClass, age, parentId, phoneNo);
      studentNameController.clear();
      studentClassController.clear();
      studentAgeController.clear();
      parentIDController.clear();
      phoneNoController.clear();

      isTyping.value = false;
      isUnder.value = false;
    }
  }
}