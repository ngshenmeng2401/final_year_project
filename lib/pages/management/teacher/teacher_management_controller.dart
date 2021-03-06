import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_student_view.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/staff/management_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherManagementController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchStudentController = new TextEditingController();

  var studentList = <Student>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var isTyping = false.obs;
  var isUnder = false.obs;

  List<String> sortingList = [
    "Default",
    "idD",
    "nameA",
    "nameD",
  ];
  var selectSorting = "Default";

  @override
  void onInit() {

    super.onInit();
    checkTextField();
    loadStudentList();
  }

  void loadStudentList() async{

    try {
      isLoading(true);
      var student = await StaffManagementRemoteServices.fetchStudent("a", "load", "a");
      if (student != null) {
        studentList.assignAll(student);
      } else {
        statusMsj("No any student record".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

  Future<void> searchStudent() async {

    String searchStudent = searchStudentController.text.toString();
    studentList.clear();

    try {
      isLoading(true);
      var student = await StaffManagementRemoteServices.fetchStudent(searchStudent, "search", "a");
      if (student != null) {
        studentList.assignAll(student);
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
      var student = await StaffManagementRemoteServices.fetchStudent("1", "sort", sortValue);
      if (student != null) {
        studentList.assignAll(student);
      } else {
        // gaeUnittList = null;
        statusMsj("No data".tr);
      }
    } finally {
      isLoading(false);
    }
  }

  void checkTextField(){

    searchStudentController.text.isEmpty
      ? isSearching.value = false
      : isSearching.value = true;
  }

  void clearTextField(){
    searchStudentController.clear();
    isSearching.value = false;
    // studentList.clear();
    loadStudentList();
  }

  void sortStudentDialog(){

    Get.defaultDialog(
      
      title: "Sort by:".tr,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<TeacherManagementController>(
            init: TeacherManagementController(),
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
          GetBuilder<TeacherManagementController>(
            init: TeacherManagementController(),
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
          GetBuilder<TeacherManagementController>(
            init: TeacherManagementController(),
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
          GetBuilder<TeacherManagementController>(
            init: TeacherManagementController(),
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

  void deleteStudentDetailsDialog(String id, String age, String className){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        StaffManagementRemoteServices.deleteStudentDetails(id, age, className),
        studentList.clear(),
        Future.delayed(const Duration(milliseconds: 1000), () {
          loadStudentList();
        }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void navigateAddStudentView(){

    Get.toNamed(AppRoutes.AddStudentDetailsPage)!.then((value) => loadStudentList());
  }

  void navigateEditStudentView(Student student){

    Get.to(() => EditStudentDetailsView(student))!.then((value) => loadStudentList());
  }
}