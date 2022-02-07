import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  late TextEditingController searchClassController = new TextEditingController();

  List<String> className = [
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

}