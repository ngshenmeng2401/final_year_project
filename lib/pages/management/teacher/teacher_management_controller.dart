import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/teacher_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherManagementController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchStudentController = new TextEditingController();

  var studentList = <Student>[].obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var isTyping = false.obs;
  var isUnder = false.obs;

  List<String> studentName = [
    "Lim Jun Jie",
    "Jay Chou",
    "Emma Stone",
    "Ahmad",
    "Ng Shen Meng",
    "Akmal Hanis",
    "Steve Rogers",
    "Lim Jun Jie",
    "Jay Chou",
    "Emma Stone",
    "Ahmad",
    "Ng Shen Meng",
    "Akmal Hanis",
    "Steve Rogers",
  ];

  @override
  void onInit() {

    super.onInit();
    checkTextField();
    loadStudentList();
  }

  void loadStudentList() async{

    
    var student = await TeacherRemoteServices.fetchStudent();
    if (student != null) {
      studentList.clear();
      studentList.assignAll(student);
    } else {
      statusMsj("No any post".tr);
    }
  }

  Future<void> searchStudent() async {

    // searchProductController.text = "Bake";

    // try {
    //   isLoading(true);
    //   var products = await TeacherRemoteServices.searchProduct(searchProductController.text.toString());
    //   if (products != null) {
    //     studentList.assignAll(products);
    //     searchResult.value = true;
    //   } else {
    //     searchResult.value = false;
    //     statusMsj("Not_Found".tr);
    //   }
    // } finally {
    //   isLoading(false);
    // }
  }

  void checkTextField(){

    searchStudentController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchStudentController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void navigateAddStudentView(){

    Get.toNamed(AppRoutes.AddStudentDetailsPage)!.then((value) => loadStudentList());
  }

  void navigateEditStudentView(){

    Get.toNamed(AppRoutes.EditStudentDetailsPage);
  }
}