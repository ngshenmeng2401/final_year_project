import 'dart:async';

import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/parent/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentHomeController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchChildrenController = new TextEditingController();

  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var childrenList = <Children>[].obs;
  late Timer? timer;

  @override
  void onInit() {

    super.onInit();
    checkTextField();
    timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    // loadClassroomList();
  }

  void loadClassroomList() async{

    try {
      isLoading(true);
      var children = await ParentHomeRemoteServices.fetchChildren("a", "load");
      if (children != null) {
        childrenList.assignAll(children);
      } else {
        statusMsj("No any class".tr);
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
    statusMsj("Search_Product".tr);
  }

  void deleteRecordDialog(String studentId){

    Get.defaultDialog(
      title: "Delete? Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        ParentHomeRemoteServices.deleteRecord(studentId),
        childrenList.clear(),
        Future.delayed(const Duration(milliseconds: 1000), () {
          loadClassroomList();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateChildrenDetailsPage(String childrenName){

    Get.toNamed(AppRoutes.ChildrenDetailsPage);
  }
}