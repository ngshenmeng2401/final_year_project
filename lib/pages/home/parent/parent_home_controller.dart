import 'package:final_year_project/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentHomeController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchChildrenController = new TextEditingController();

  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  List<String> childrenName = [
    "Wong Jun Jie",
    "Wong Li Wen",
    "Wong Kai Lnn",
  ];

  Future<void> searchChildren() async {

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

    searchChildrenController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchChildrenController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void navigateChildrenDetailsPage(String childrenName){

    Get.toNamed(AppRoutes.ChildrenDetailsPage);
  }
}