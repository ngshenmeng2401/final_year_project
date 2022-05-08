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
  var studentID = "".obs, studentName = "".obs, seenStatus = "".obs;
  var result1 = "".obs, result2 = "".obs, result3 = "".obs, result4 = "".obs, result5 = "".obs;
  var resultList = [];

  @override
  void onInit() {

    super.onInit();
    // timer = Timer.periodic(const Duration(seconds: 2), (Timer t) => loadClassroomList());
    loadResultList();
  }

  void loadResultList() async{

    String studentId = appData.read("studentId")??'';
    String category = appData.read("category")??'';
    studentID.value = studentId;

    // try {
    //   isLoading(true);
      if(category == "listening"){

        var listeningResult = await ParentHomeRemoteServices.fetchChildrenListeningResult(studentId);
        if (listeningResult != null) {
          listeningResultList.assignAll(listeningResult);
          
          studentName.value = listeningResultList[0].name.toString();
          result1.value = listeningResultList[0].lq1.toString();
          result2.value = listeningResultList[0].lq2.toString();
          result3.value = listeningResultList[0].lq3.toString();
          result4.value = listeningResultList[0].lq4.toString();
          seenStatus.value = listeningResultList[0].listeningSeenStatus.toString();

        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "reading"){

        var readingResult = await ParentHomeRemoteServices.fetchChildrenReadingResult(studentId);
        if (readingResult != null) {
          readingResultList.assignAll(readingResult);

          studentName.value = readingResultList[0].name.toString();
          result1.value = readingResultList[0].rq1.toString();
          result2.value = readingResultList[0].rq2.toString();
          result3.value = readingResultList[0].rq3.toString();
          result4.value = readingResultList[0].rq4.toString();
          seenStatus.value = readingResultList[0].readingSeenStatus.toString();

        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "speaking"){

        var speakingResult = await ParentHomeRemoteServices.fetchChildrenSpeakingResult(studentId);
        if (speakingResult != null) {
          speakingResultList.assignAll(speakingResult);

          studentName.value = speakingResultList[0].name.toString();
          result1.value = speakingResultList[0].sq1.toString();
          result2.value = speakingResultList[0].sq2.toString();
          result3.value = speakingResultList[0].sq3.toString();
          result4.value = speakingResultList[0].sq4.toString();
          result5.value = speakingResultList[0].sq5.toString();
          seenStatus.value = speakingResultList[0].speakingSeenStatus.toString();

        } else {
          statusMsj("No any record".tr);
        }

      }else if(category == "writing"){

        var writingResult = await ParentHomeRemoteServices.fetchChildrenWritingResult(studentId);
        if (writingResult != null) {
          writingResultList.assignAll(writingResult);

          studentName.value = writingResultList[0].name.toString();
          result1.value = writingResultList[0].wq1.toString();
          result2.value = writingResultList[0].wq2.toString();
          seenStatus.value = writingResultList[0].writingSeenStatus.toString();

        } else {
          statusMsj("No any record".tr);
        }

      }  
    // } finally {
    //   isLoading(false);
    // }
  }

  void acceptResult(double screenWidth){

    String studentId = appData.read("studentId")??'';
    String category = appData.read("category")??'';

    Get.defaultDialog(
      title: "Accept the result?".tr,
      titleStyle: TextStyle(fontSize: 20),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth/2,
            child: Text("Once the result was accepted, the result can't be changed.",
              textAlign: TextAlign.center),
          )
        ],
      ),
      textConfirm: "Accept".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => {
        Get.back(),
        ParentHomeRemoteServices.acceptResult(studentId, category),
        listeningResultList.clear(),
        readingResultList.clear(),
        speakingResultList.clear(),
        writingResultList.clear(),
        Future.delayed(const Duration(milliseconds: 1000), () {
          loadResultList();
        }),
        // loadResultList(),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }
}