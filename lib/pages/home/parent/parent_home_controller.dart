import 'dart:async';

import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/parent/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ParentHomeController extends GetxController{

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
    checkTextField();
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    loadChildrenList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void loadChildrenList() async{

    try {
      isLoading(true);
      var children = await ParentHomeRemoteServices.fetchChildren("a", "load");
      if (children != null) {
        childrenList.assignAll(children);

      } else {
        statusMsj("No any children record".tr);
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

  void navigateChildrenRecordPage(String studentId, String listeningResult, String readingResult, String speakingResult, String writingResult){

    bool isDarkMode = appData.read("isDarkMode") ?? false;

    print(listeningResult);
    print(readingResult);
    print(speakingResult);
    print(writingResult);

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
            onTap: listeningResult == "yes" 
            ? () {
              Get.back();
              appData.write("category", "listening");
              appData.write("studentId", studentId);
              Get.toNamed(AppRoutes.ListeningResultPage)!.then((value) => loadChildrenList());
            }
            : (){
              resultDialog("Error","Result haven't release.");
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
            onTap: readingResult == "yes" 
            ? () {
              Get.back();
              appData.write("category", "reading");
              appData.write("studentId", studentId);
              Get.toNamed(AppRoutes.ReadingResultPage)!.then((value) => loadChildrenList());
            } 
            : (){
              resultDialog("Error","Result haven't release.");
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
            onTap: speakingResult == "yes" 
            ? () {
              Get.back();
              appData.write("category", "speaking");
              appData.write("studentId", studentId);
              Get.toNamed(AppRoutes.SpeakingResultPage)!.then((value) => loadChildrenList());
            }
            : (){
              resultDialog("Error","Result haven't release.");
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
            onTap: writingResult == "yes" 
            ? () {
              Get.back();
              appData.write("category", "writing");
              appData.write("studentId", studentId);
              Get.toNamed(AppRoutes.WritingResultPage)!.then((value) => loadChildrenList());
            }
            : (){
              resultDialog("Error","Result haven't release.");
            },
          )
        ],
      ),
      textConfirm: null,
      textCancel: null,
      buttonColor: Colors.black,
    );
  }

  void resultDialog(String title, String subtitle){

    Get.snackbar(
      title,subtitle,
      backgroundColor: Colors.white60,
      colorText: Colors.black,
      icon: const Icon(Icons.error, color: Colors.black),
      snackPosition: SnackPosition.TOP,  
    );
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

  void navigateChildrenDetailsPage(String childrenName){

    Get.toNamed(AppRoutes.ChildrenDetailsPage);
  }
}