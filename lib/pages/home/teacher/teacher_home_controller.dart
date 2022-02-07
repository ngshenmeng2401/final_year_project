import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherHomeController extends GetxController{

  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  late TextEditingController searchClassController = new TextEditingController();

  List<String> classNameList = [
    "The Pumpkin Patch",
    "Thrashers Corner",
    "A Child’s Place",
    "Fun Acres Preschool",
    "Treasure Island",
    "Paradise Petals",
    "The Toddler House",
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

    searchClassController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchClassController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void navigateRecordListPage(String className){

    // print(className);
    Get.to(() => RecordListView(className));
  }

}