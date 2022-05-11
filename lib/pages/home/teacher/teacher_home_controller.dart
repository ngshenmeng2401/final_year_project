import 'package:final_year_project/model/classroom.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/staff/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TeacherHomeController extends GetxController{

  final appData = GetStorage();
  var isSearching = false.obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var classroomList = <Classroom>[].obs;

  late TextEditingController searchClassController = new TextEditingController();

  @override
  void onInit() {

    super.onInit();
    checkTextField();
    loadClassroomList();
  }

  void loadClassroomList() async{

    try {
      isLoading(true);
      var classroom = await StaffHomeRemoteServices.fetchClassroom("a", "load", "a");
      if (classroom != null) {
        classroomList.assignAll(classroom);
      } else {
        statusMsj("No any class".tr);
      }
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

  void navigateRecordListPage(Classroom classroom){

    bool isDarkMode = appData.read("isDarkMode") ?? false;

    Get.defaultDialog(
      
      title: "Categories:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: isDarkMode == true ? Colors.grey[850] : Colors.grey[100],
            // leading: Text("1."),
            title: Text("Listening".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              appData.write("category", "listening");
              appData.write("className", classroom.className);
              Get.toNamed(AppRoutes.RecordListPage);
            },
          ),
          SizedBox(height: 5),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: isDarkMode == true ? Colors.grey[850] : Colors.grey[100],
            // leading: Text("2."),
            title: Text("Reading".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              appData.write("category", "reading");
              appData.write("className", classroom.className);
              Get.toNamed(AppRoutes.RecordListPage);
            },
          ),
          SizedBox(height: 5),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: isDarkMode == true ? Colors.grey[850] : Colors.grey[100],
            // leading: Text("3."),
            title: Text("Speaking".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              appData.write("category", "speaking");
              appData.write("className", classroom.className);
              Get.toNamed(AppRoutes.RecordListPage);
            },
          ),
          SizedBox(height: 5),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            tileColor: isDarkMode == true ? Colors.grey[850] : Colors.grey[100],
            // leading: Text("4."),
            title: Text("Writing".tr),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Get.back();
              appData.write("category", "writing");
              appData.write("className", classroom.className);
              Get.toNamed(AppRoutes.RecordListPage);
            },
          )
        ],
      ),
      textConfirm: null,
      textCancel: null,
      buttonColor: Colors.black,
    );
  }

  // void navigateRecordListPage(Classroom classroom){

  //   appData.write("className", classroom.className);
  //   Get.toNamed(AppRoutes.RecordListPage);
  // }

}