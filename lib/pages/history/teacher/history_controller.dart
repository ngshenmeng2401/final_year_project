import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/pages/history/teacher/test_list/test_list_view.dart';
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
  var studentList = <Student>[].obs;

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
    
    loadStudentList();
    super.onInit();
  }

  void loadStudentList() async{

    try {
      isLoading(true);
      var student = await HistoryRemoteServices.fetchStudentList("a", "load", "a");
      if (student != null) {
        studentList.assignAll(student);
      } else {
        statusMsj("No any student record".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

  Future<void> searchStudentList() async {

    String searchStudent = searchNameController.text.toString();
    studentList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchStudentList(searchStudent, "search", "a");
      if (testReocrd != null) {
        studentList.assignAll(testReocrd);
        print(studentList);
      } else {
        statusMsj("No data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  Future<void> sortStudent(String sortValue) async {

    studentList.clear();

    try {
      isLoading(true);
      var testReocrd = await HistoryRemoteServices.fetchStudentList("1", "sort", sortValue);
      if (testReocrd != null) {
        studentList.assignAll(testReocrd);
      } else {
        // gaeUnittList = null;
        statusMsj("No data".tr);
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
    statusMsj("Search Product".tr);
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
                  activeColor: Colors.blue[400],
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
                  activeColor: Colors.blue[400],
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
                  activeColor: Colors.blue[400],
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
                  activeColor: Colors.blue[400],
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

  void navigateAddHistoryView(){

    Get.toNamed(AppRoutes.AddHistoryPage)!.then((value) => loadStudentList());
  }

  void navigateTestListView(Student student){

    appData.write("id", student.id);
    Get.to(() => TestListView(student))!.then((value) => loadStudentList());
  }
}