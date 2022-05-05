import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddHistoryCOntroller extends GetxController{

  final List<String> studentNameList = ["ID", "Ali", "Johnny"];
  var selectName = 'ID';

  final List<String> codeList = ["BI 1", "BI 2", "BI 3", "BI 4", "BI 5"];
  var selectCode = 'BI 1';

  final List<String> levelList = ["1", "2", "3"];
  var selectLevel = '1';

  var selectedDate = DateTime.now().obs;

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
    }
  }


}