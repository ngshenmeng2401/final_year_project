import 'package:final_year_project/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherManagementController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchStudentController = new TextEditingController();
  late TextEditingController studentIDController = new TextEditingController();
  late TextEditingController studentNameController = new TextEditingController();
  late TextEditingController studentClassController = new TextEditingController();
  late TextEditingController studentAgeController = new TextEditingController();
  late TextEditingController parentIDController = new TextEditingController();
  late TextEditingController phoneNoController = new TextEditingController();

  // var productList = <Product>[].obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

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

  Future<void> searchStudent() async {

    // searchProductController.text = "Bake";

    try {
      isLoading(true);
      // var products = await ProductRemoveService.searchProduct(searchProductController.text.toString());
      // if (products != null) {
      //   productList.assignAll(products);
      //   searchResult.value = true;
      // } else {
      //   searchResult.value = false;
      //   statusMsj("Not_Found".tr);
      // }
    } finally {
      isLoading(false);
    }
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

    Get.toNamed(AppRoutes.AddStudentDetailsPage);
  }

  void navigateEditStudentView(){

    Get.toNamed(AppRoutes.EditStudentDetailsPage);
  }
}