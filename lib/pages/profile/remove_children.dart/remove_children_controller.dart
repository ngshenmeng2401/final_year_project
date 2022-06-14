import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/service/parent/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoveChildrenSlotController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchChildrenController = new TextEditingController();

  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var childrenList = <Children>[].obs;

  @override
  void onInit() {

    super.onInit();
    checkTextField();
    loadChildrenList();
  }

  void loadChildrenList() async{

    try {
      isLoading(true);
      var children = await ParentHomeRemoteServices.fetchChildren("a", "load");
      if (children != null) {
        childrenList.assignAll(children);

      } else {
        statusMsj("No any children record".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

  Future<void> searchChildren() async {

    String searchChildren = searchChildrenController.text.toString();
    childrenList.clear();

    try {
      isLoading(true);
      var student = await ParentHomeRemoteServices.fetchChildren(searchChildren, "search");
      if (student != null) {
        childrenList.assignAll(student);

        print(childrenList);
      } else {
        statusMsj("No record".tr);
      }
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
    statusMsj("Search Product".tr);
    loadChildrenList();
  }

  void removeChildrenDialog(Children children){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Remove".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => {
        ParentHomeRemoteServices.removeChildrenSlot(children),
        Get.back(),
        Future.delayed(const Duration(milliseconds: 1000), () {
          loadChildrenList();
        }),
      },
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.black,
    );
  }
}