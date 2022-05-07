import 'package:final_year_project/service/staff/history_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditTestRecordController extends GetxController{

  final List<String> codeList = ["BI 1", "BI 2", "BI 3", "BI 4", "BI 5"];
  var selectCode = 'BI 1';

  final List<String> levelList = ["1", "2", "3"];
  var selectLevel = '1';

  var selectedDate = DateTime.now().obs;
  var dateResult = DateFormat("yyyy-MM-dd");

  // var studentList = <Student>[].obs;
  var isLoading = true.obs;
  var statusMsj = "Loading".obs;

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

  void editRecordDialog(String testId, String previousTestDate){

    Get.defaultDialog(
      title: "Are you sure ?".tr,
      content: Column(),
      textConfirm: "Yes".tr,
      textCancel: "No".tr,
      onConfirm:() => {
        Get.back(),
        HistoryRemoteServices.editTestRecord(testId, previousTestDate, dateResult.format(selectedDate.value)),
      },
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }
}