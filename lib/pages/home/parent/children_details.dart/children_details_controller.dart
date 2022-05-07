import 'package:final_year_project/model/children_listening_result.dart';
import 'package:final_year_project/model/children_reading_result.dart';
import 'package:final_year_project/model/children_speaking_result.dart';
import 'package:final_year_project/model/children_writing_result.dart';
import 'package:final_year_project/service/parent/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChildrenDetailsController extends GetxController{

  final appData = GetStorage();
  var listeningResultList = <ChildrenListeningResult>[].obs;
  var readingResultList = <ChildrenReadingResult>[].obs;
  var speakingResultList = <ChildrenSpeakingResult>[].obs;
  var writingResultList = <ChildrenWritingResult>[].obs;

  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {

    super.onInit();
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    loadResultList();
  }

  void loadResultList() async{

    String studentId = appData.read("studentId")??'';
    String category = appData.read("category")??'';

    // try {
    //   isLoading(true);
      if(category == "listening"){

        var listeningResult = await ParentHomeRemoteServices.fetchChildrenListeningResult(studentId);
        if (listeningResult != null) {
          listeningResultList.assignAll(listeningResult);
          for(int i = 0; i < listeningResultList.length; i++){
            
          }

        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingResult = await ParentHomeRemoteServices.fetchChildrenReadingResult(studentId);
        if (readingResult != null) {
          readingResultList.assignAll(readingResult);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingResult = await ParentHomeRemoteServices.fetchChildrenSpeakingResult(studentId);
        if (speakingResult != null) {
          speakingResultList.assignAll(speakingResult);
        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingResult = await ParentHomeRemoteServices.fetchChildrenWritingResult(studentId);
        if (writingResult != null) {
          writingResultList.assignAll(writingResult);
        } else {
          statusMsj("No any record".tr);
        }

      }  
    // } finally {
    //   isLoading(false);
    // }
    
  }

  void confirmResult(){

    Get.defaultDialog(
      title: "Please_key_in:".tr,
      content: Column(),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => Get.back(),
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }
}