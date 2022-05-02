import 'package:final_year_project/model/classroom.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/teacher_remote_services.dart';
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
      var classroom = await TeacherRemoteServices.fetchClassroom("a", "load", "a");
      if (classroom != null) {
        classroomList.assignAll(classroom);
      } else {
        statusMsj("No any post".tr);
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

    appData.write("className", classroom.className);
    Get.toNamed(AppRoutes.RecordListPage);
  }

}