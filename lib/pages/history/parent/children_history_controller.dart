import 'dart:async';

import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/pages/history/parent/test_date_list.dart/test_date_view.dart';
import 'package:final_year_project/service/parent/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChildrenHistoryController extends GetxController{

  
  final appData = GetStorage();
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
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    loadChildrenList();
  }

  void loadChildrenList() async{

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
    childrenList.clear();
    loadChildrenList();
    statusMsj("Loading".tr);
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
          loadChildrenList();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateChildrenHistoryPage(Children children){

    Get.to(() => TestDateView(children));
  }
}