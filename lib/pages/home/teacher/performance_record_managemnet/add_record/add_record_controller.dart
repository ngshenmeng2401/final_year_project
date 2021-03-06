import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/service/staff/home_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddRecordController extends GetxController{

  final List<String> levelLQ = ["1","1","1","1"];
  final List<String> levelRQ = ["1","1","1","1"];
  final List<String> levelSQ = ["1","1","1","1","1"];
  final List<String> levelWQ = ["1","1"];

  final List<String> level = ["1","2","3",];

  final appData = GetStorage(); 
  var studentList = <Student>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  final List<String> studentNameList = ["ID",];
  var selectName = 'ID';
  var selectedName;

  @override
  void onInit() {

    super.onInit();
    loadStudentList();
  }

  void loadStudentList() async{

    String className = appData.read("className")??'';
    String category = appData.read("category")??'';
    print(category);

    try {
      isLoading(true);
      var student = await StaffHomeRemoteServices.fetchStudentWithClass(className, category);
      if (student != null) {
        studentList.assignAll(student);

        for(int i = 0; i < studentList.length; i++){
          // studentNameList.insert(i, studentList[i].id.toString());
          studentNameList.add(studentList[i].id.toString() + " " + studentList[i].name.toString());
          // print(studentNameList);
          update();
        }
      } else {
        statusMsj("No any post".tr);
      }
    } finally {
      isLoading(false);
    }
    
  }

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

  void chooseStudent(value){
     selectName = value;
     selectedName = value;
     print(selectName);
     update();
  }

  void addRecordDialog(String category){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        addRecord(category),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void addRecord(String category){

    String q1, q2, q3, q4, q5;
  
    print(selectName);
    print(category);
    final splittedName = selectName.split(' ');
    print(splittedName[0]);

    if(category == "listening"){

      q1 = levelLQ[0];
      q2 = levelLQ[1];
      q3 = levelLQ[2];
      q4 = levelLQ[3];

      StaffHomeRemoteServices.addListeningRecord(splittedName[0], q1, q2, q3, q4);

    }else if(category == "reading"){

      q1 = levelRQ[0];
      q2 = levelRQ[1];
      q3 = levelRQ[2];
      q4 = levelRQ[3];

      StaffHomeRemoteServices.addReadingRecord(splittedName[0], q1, q2, q3, q4);

    }else if(category == "speaking"){

      q1 = levelSQ[0];
      q2 = levelSQ[1];
      q3 = levelSQ[2];
      q4 = levelSQ[3];
      q5 = levelSQ[4];

      StaffHomeRemoteServices.addSpeakingRecord(splittedName[0], q1, q2, q3, q4, q5);

    }else if(category == "writing"){

      q1 = levelWQ[0];
      q2 = levelWQ[1];

      StaffHomeRemoteServices.addWritingRecord(splittedName[0], q1, q2);

    }
    // print("Student List length: " + studentList.length.toString());
    // print("Student Name List length: " + studentNameList.length.toString());
    // print("Select name: " + selectName);
    selectName = "ID";
    studentNameList.remove(selectedName);
    update();
  }
}