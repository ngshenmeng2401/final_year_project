import 'dart:async';

import 'package:final_year_project/main.dart';
import 'package:final_year_project/model/test_record.dart';
import 'package:final_year_project/service/parent/history_remote_services.dart';
import 'package:final_year_project/service/staff/history_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestDateController extends GetxController{

  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var testRecordList = <TestRecord>[].obs;
  late Timer? timer;

  final List<String> codeList = [
    "Default", 
    "BI 1", 
    "BI 2", 
    "BI 3", 
    "BI 4", 
    "BI 5"
  ];
  var selectSorting = "Default";

  @override
  void onInit() {

    super.onInit();
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    loadTestRecordList();
  }

  void loadTestRecordList() async{

    String studentId = appData.read("id")??'';

    try {
      isLoading(true);
      var testRecord = await ParentHistoryRemoteService.fetchChildrenTestRecord("a", "load", "a", studentId);
      if (testRecord != null) {
        testRecordList.assignAll(testRecord);

      } else {
        statusMsj("No any record".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

  Future<void> sortStudent(String sortValue) async {

    String studentId = appData.read("id")??'';
    testRecordList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord("1", "sort", sortValue, studentId);
      if (testReocrd != null) {
        testRecordList.assignAll(testReocrd);
      } else {
        // gaeUnittList = null;
        statusMsj("No data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void sortTestRecordDialog(){

    Get.defaultDialog(
      
      title: "Sort by:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<TestDateController>(
            init: TestDateController(),
            builder: (controller) {
              return ListTile(
                title: Text("Default".tr),
                trailing: Radio(
                  activeColor: Colors.blue[400],
                  value: codeList[0],
                  groupValue: selectSorting,
                  onChanged: (value) {
                    clickSorting(value);
                  }),
              );
            },
          ),
          GetBuilder<TestDateController>(
            init: TestDateController(),
            builder: (controller) {
              return ListTile(
                title: Text("BI 1".tr),
                trailing: Radio(
                  activeColor: Colors.blue[400],
                  value: codeList[1],
                  groupValue: selectSorting,
                  onChanged: (value) {
                    clickSorting(value);
                  }),
              );
            },
          ),
          GetBuilder<TestDateController>(
            init: TestDateController(),
            builder: (controller) {
              return ListTile(
                title: Text("BI 2".tr),
                trailing: Radio(
                  activeColor: Colors.blue[400],
                  value: codeList[2],
                  groupValue: selectSorting,
                  onChanged: (value) {
                    clickSorting(value);
                  }),
              );
            },
          ),
          GetBuilder<TestDateController>(
            init: TestDateController(),
            builder: (controller) {
              return ListTile(
                title: Text("BI 3".tr),
                trailing: Radio(
                  activeColor: Colors.blue[400],
                  value: codeList[3],
                  groupValue: selectSorting,
                  onChanged: (value) {
                    clickSorting(value);
                  }),
              );
            },
          ),
          GetBuilder<TestDateController>(
            init: TestDateController(),
            builder: (controller) {
              return ListTile(
                title: Text("BI 4".tr),
                trailing: Radio(
                  activeColor: Colors.blue[400],
                  value: codeList[4],
                  groupValue: selectSorting,
                  onChanged: (value) {
                    clickSorting(value);
                  }),
              );
            },
          ),
          GetBuilder<TestDateController>(
            init: TestDateController(),
            builder: (controller) {
              return ListTile(
                title: Text("BI 5".tr),
                trailing: Radio(
                  activeColor: Colors.blue[400],
                  value: codeList[5],
                  groupValue: selectSorting,
                  onChanged: (value) {
                    clickSorting(value);
                  }),
              );
            },
          ),
        ],
      ),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm: () {
        Get.back();
        sortStudent(selectSorting);
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void clickSorting(value) {
    selectSorting = value;
    // print(selectSorting);
    update();
  }

}