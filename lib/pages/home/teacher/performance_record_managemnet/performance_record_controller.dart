import 'package:final_year_project/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformanceRecordController extends GetxController{

  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  late TextEditingController searchRecordController = new TextEditingController();

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

  Future<void> searchRecord() async {

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

    searchRecordController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchRecordController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void navigateAddRecordView(){

    // Get.toNamed(AppRoutes.AddRecordDetailsPage);
  }
}