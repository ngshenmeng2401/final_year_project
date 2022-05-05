import 'package:final_year_project/service/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPerformanceRecordController extends GetxController{

  final List<String> levelLQ = ["1","1","1","1"];
  final List<String> levelRQ = ["1","1","1","1"];
  final List<String> levelSQ = ["1","1","1","1","1"];
  final List<String> levelWQ = ["1","1"];

  final List<String> level = ["1","2","3",];

  void chooseLQLevel(value, int index){
    levelLQ[index] = value;
    print(levelLQ);
    update();
  }

  void chooseRQLevel(value, int index){
     levelRQ[index] = value;
     print(levelRQ);
     update();
  }

  void chooseSQLevel(value, int index){
     levelSQ[index] = value;
     print(levelSQ);
     update();
  }

  void chooseWQLevel(value, int index){
     levelWQ[index] = value;
     print(levelWQ);
     update();
  }

  void editRecordDialog(String category, String studentId){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        editRecord(category, studentId),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void editRecord(String category, String studentId){

    String q1, q2, q3, q4, q5;
  
    print(studentId);
    print(category);

    if(category == "listening"){

      q1 = levelLQ[0];
      q2 = levelLQ[1];
      q3 = levelLQ[2];
      q4 = levelLQ[3];

      // print(q1 + " " + q2 + " " + q3 + " " + q4);

      HomeRemoteServices.editListeningRecord(studentId, q1, q2, q3, q4);

    }else if(category == "reading"){

      q1 = levelRQ[0];
      q2 = levelRQ[1];
      q3 = levelRQ[2];
      q4 = levelRQ[3];

      // print(q1 + " " + q2 + " " + q3 + " " + q4);

      HomeRemoteServices.editReadingRecord(studentId, q1, q2, q3, q4);

    }else if(category == "speaking"){

      q1 = levelSQ[0];
      q2 = levelSQ[1];
      q3 = levelSQ[2];
      q4 = levelSQ[3];
      q5 = levelSQ[4];

      // print(q1 + " " + q2 + " " + q3 + " " + q4 + " " + q5);

      HomeRemoteServices.editSpeakingRecord(studentId, q1, q2, q3, q4, q5);

    }else if(category == "writing"){

      q1 = levelWQ[0];
      q2 = levelWQ[1];

      // print(q1 + " " + q2);

      HomeRemoteServices.editWritingRecord(studentId, q1, q2);

    }
  }

  void deleteRecordDialog(String category, String studentId){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        HomeRemoteServices.deleteRecord(category, studentId),
        // Future.delayed(const Duration(milliseconds: 500), () {
          Get.back(),
        // }),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  
}