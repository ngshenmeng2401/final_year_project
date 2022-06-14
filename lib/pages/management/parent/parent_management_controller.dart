import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/staff/management_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentManagementController extends GetxController{

  var isSearching = false.obs;
  late TextEditingController searchChildrenController = new TextEditingController();
  late TextEditingController parentIDController = new TextEditingController();
  late TextEditingController phoneNoController = new TextEditingController();

  // var productList = <Product>[].obs;
  var searchResult = false.obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;
  var studentList = <Student>[].obs;

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

  Future<void> searchChildren() async {

    String searchChildren = searchChildrenController.text.toString();
    studentList.clear();

    try {
      isLoading(true);
      var student = await StaffManagementRemoteServices.fetchStudent(searchChildren, "search", "a");
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
    loadStudentList();
  }

  void navigateAddStudentView(){

    Get.toNamed(AppRoutes.AddStudentDetailsPage);
  }

  void addChildrenDialog(String studentId){

    Get.defaultDialog(
      title: "Please key in:".tr,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            child: TextField(
              controller: parentIDController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Parent ID".tr
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15,10,15,0),
            child: TextField(
              controller: phoneNoController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Phone No".tr
              ),
            ),
          ),
        ],
      ),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => {
        checkAddChildren(studentId),
        Get.back(),
      } ,
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.black,
      buttonColor: Colors.black,
    );
  }

  void checkAddChildren(String studentId){

    String parentID = parentIDController.text.toString();
    String phoneNo = phoneNoController.text.toString();

    if(parentID.isEmpty){

      Get.snackbar(
        "Error".tr,"ParentIC is Empty".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if(phoneNo.isEmpty){

      Get.snackbar(
        "Error".tr,"PhoneNo is Empty".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else if(phoneNo.isEmpty && parentID.isEmpty){

      Get.snackbar(
        "Error".tr,"Please complete all field".tr,
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else{

      Get.back();
      StaffManagementRemoteServices.addChildren(studentId, parentID, phoneNo);
      parentIDController.clear();
      phoneNoController.clear();
      Future.delayed(const Duration(milliseconds: 1000), () {
          loadStudentList();
      });
    }
  }
}