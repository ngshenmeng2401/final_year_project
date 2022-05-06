import 'package:final_year_project/model/test_record.dart';
import 'package:final_year_project/pages/history/edit_test_date/edit_history_view.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/staff/history_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryController extends GetxController{

  final appData = GetStorage();
  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var testReocrdList = <TestReocrd>[].obs;

  late TextEditingController searchNameController = new TextEditingController();

  List<String> sortingList = [
    "Default",
    "idD",
    "nameA",
    "nameD",
  ];
  var selectSorting = "Default";

  @override
  void onInit() {
    
    loadTestRecordList();
    super.onInit();
  }

  void loadTestRecordList() async{

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord("a", "load", "a");
      if (testReocrd != null) {
        testReocrdList.assignAll(testReocrd);
      } else {
        statusMsj("No any student record".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

  Future<void> searchTestRecord() async {

    String searchStudent = searchNameController.text.toString();
    testReocrdList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord(searchStudent, "search", "a");
      if (testReocrd != null) {
        testReocrdList.assignAll(testReocrd);
        print(testReocrdList);
      } else {
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> sortStudent(String sortValue) async {

    testReocrdList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchTestRecord("1", "sort", sortValue);
      if (testReocrd != null) {
        testReocrdList.assignAll(testReocrd);
      } else {
        // gaeUnittList = null;
        statusMsj("No_data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void checkTextField(){

    searchNameController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchNameController.clear();
    isSearching.value = false;
    // productList.clear();
    statusMsj("Search_Product".tr);
  }

  void sortTestRecordDialog(){

    Get.defaultDialog(
      
      title: "Sort by:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<HistoryController>(
            init: HistoryController(),
            builder: (controller) {
              return ListTile(
                title: Text("Default".tr),
                trailing: Radio(
                    value: sortingList[0],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<HistoryController>(
            init: HistoryController(),
            builder: (controller) {
              return ListTile(
                title: Text("Student Id with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[1],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<HistoryController>(
            init: HistoryController(),
            builder: (controller) {
              return ListTile(
                title: Text("Name with Ascending Order".tr),
                trailing: Radio(
                    value: sortingList[2],
                    groupValue: selectSorting,
                    onChanged: (value) {
                      clickSorting(value);
                    }),
              );
            },
          ),
          GetBuilder<HistoryController>(
            init: HistoryController(),
            builder: (controller) {
              return ListTile(
                title: Text("Name with Descending Order".tr),
                trailing: Radio(
                    value: sortingList[3],
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
        loadTestRecordList(),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateAddHistoryView(){

    Get.toNamed(AppRoutes.AddHistoryPage)!.then((value) => loadTestRecordList());
  }

  void navigateEditHistoryView(TestReocrd testReocrd){

    Get.to(() => EditHistoryView(testReocrd))!.then((value) => loadTestRecordList());
  }
}