import 'package:final_year_project/pages/management/teacher/edit_student/edit_age.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_class.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_parent_id.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_phone_no.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_student_name.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/management_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditStudentDetailsController extends GetxController{

  late TextEditingController valueController = new TextEditingController();

  var isTyping = false.obs;
  var isUnder = true.obs;
  var isUpdate = false.obs;

  late var selectClass;
  late var oldValue;
  final List<String> studentClass = ["Amanah","Bestari","Cerdas"];

  @override
  void onInit() {
    super.onInit();
    checkStudentForm();
  }

  void insertValue(String text){
    valueController.text = text;
    oldValue = text;
  }

  void checkValue(String text){

    valueController.text == text 
    ? isUpdate.value = false
    : isUpdate.value = true;
  }

  void checkStudentForm(){

    if(valueController.text.isEmpty){

      isTyping.value = false;
    }else{
      isTyping.value = true;
    }
  }

  void chooseClass(value){
     selectClass = value;
     print(selectClass);
     update();
  }

  void editStudentDialog(String id, String category){

    String newValue;

    if(category == "class"){
      newValue = selectClass;
    }else{
      newValue = valueController.text.toString();
    }
    
    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        checkStudentDetails(id, oldValue, newValue, category),
        Get.back(),
        Get.back(),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void checkStudentDetails(String id, String oldValue, String newValue, String category){

    print(id);
    print(oldValue);
    print(newValue);
    print(category);

    ManagementRemoteServices.updateStudentDetails(id, oldValue, newValue, category);
    // Get.offAllNamed(AppRoutes.TeacherManagementPage);
  }

  void deleteStudentDetailsDialog(String id, String age, String className){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        ManagementRemoteServices.deleteStudentDetails(id, age, className),
        Get.back(),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateEditName(String id, String name){

    Get.to(() => EditName(id, name));
  }

  void navigateEditClass(String id, String studentClass){

    Get.to(() => EditClass(id, studentClass));
  }

  void navigateEditAge(String id, String age){

    Get.to(() => EditAge(id, age));
  }

  void navigateEditParentId(String id, String parentId){

    Get.to(() => EditParentId(id, parentId));
  }

  void navigateEditPhoneNo(String id, String phoneNo){

    Get.to(() => EditPhone(id, phoneNo));
  }
}