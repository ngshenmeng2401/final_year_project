import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/service/history_remote_services.dart';
import 'package:final_year_project/service/management_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddHistoryCOntroller extends GetxController{

  final List<String> studentNameList = ["ID"];
  var selectName = 'ID';

  final List<String> codeList = ["BI 1", "BI 2", "BI 3", "BI 4", "BI 5"];
  var selectCode = 'BI 1';

  final List<String> levelList = ["1", "2", "3"];
  var selectLevel = '1';

  var selectedDate = DateTime.now().obs;
  var dateResult = DateFormat("yyyy-MM-dd");

  var studentList = <Student>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

  @override
  void onInit() {

    super.onInit();
    loadStudentList();
  }

  void loadStudentList() async{

    try {
      isLoading(true);
      var student = await ManagementRemoteServices.fetchStudent("a", "load", "a");
      if (student != null) {
        studentList.assignAll(student);

        for(int i = 0; i < studentList.length; i++){
          // studentNameList.insert(i, studentList[i].id.toString());
          studentNameList.add(studentList[i].id.toString());
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

  void chooseStudent(value){
    selectName = value;
    print(selectName);
    update();
  }

  void chooseCode(value){
    selectCode = value;
    print(selectCode);
    update();
  }

  void chooseLevel(value){
    selectLevel = value;
    print(selectLevel);
    update();
  }

  void chooseDate() async {

    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: selectedDate.value,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: child!);
        },
        firstDate: DateTime(2000),
        lastDate: DateTime(2024),
        //initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select DOB',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        // selectableDayPredicate: disableDate
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      print(selectedDate.value);
    }
  }

  void addRecordDialog(){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        HistoryRemoteServices.addTestRecord(selectName, selectCode, selectLevel, dateResult.format(selectedDate.value)),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }
}