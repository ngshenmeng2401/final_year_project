import 'package:final_year_project/model/test_record.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/staff/history_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TestListController extends GetxController{

  final appData = GetStorage();
  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var testReocrdList = <TestRecord>[].obs;

  late TextEditingController searchCodeController = new TextEditingController();

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
    
    loadTestList();
    super.onInit();
  }

  void loadTestList() async{

    String studentId = appData.read("id")??'';

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord("a", "load", "a", studentId);
      if (testReocrd != null) {
        testReocrdList.assignAll(testReocrd);
      } else {
        statusMsj("No any student record".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> searchStudentList() async {

    String studentId = appData.read("id")??'';
    String searchCode = searchCodeController.text.toString();
    testReocrdList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord(searchCode, "search", "a", studentId);
      if (testReocrd != null) {
        testReocrdList.assignAll(testReocrd);
        print(testReocrdList);
      } else {
        statusMsj("No data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> sortStudent(String sortValue) async {

    String studentId = appData.read("id")??'';
    testReocrdList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord("1", "sort", sortValue, studentId);
      if (testReocrd != null) {
        testReocrdList.assignAll(testReocrd);
      } else {
        // gaeUnittList = null;
        statusMsj("No data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void checkTextField(){

    searchCodeController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchCodeController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search Product".tr);
  }

  void sortTestRecordDialog(){

    Get.defaultDialog(
      
      title: "Sort by:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<TestListController>(
            init: TestListController(),
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
          GetBuilder<TestListController>(
            init: TestListController(),
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
          GetBuilder<TestListController>(
            init: TestListController(),
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
          GetBuilder<TestListController>(
            init: TestListController(),
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
          GetBuilder<TestListController>(
            init: TestListController(),
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
          GetBuilder<TestListController>(
            init: TestListController(),
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

  void deleteRecordDialog(String testId){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        HistoryRemoteServices.deleteTestRecord(testId),
        loadTestList(),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateAddHistoryView(){

    Get.toNamed(AppRoutes.AddHistoryPage)!.then((value) => loadTestList());
  }

  void navigateEditHistoryView(TestRecord testReocrd){

    // Get.to(() => EditHistoryView(testReocrd))!.then((value) => loadStudentList());
  }
}