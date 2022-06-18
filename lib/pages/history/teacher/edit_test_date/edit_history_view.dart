import 'package:final_year_project/model/test_record.dart';
import 'package:final_year_project/pages/history/teacher/edit_test_date/edit_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditHistoryView extends StatelessWidget {

  final editTestRecordController = Get.put(EditTestRecordController());
  final TestRecord testReocrd;
  EditHistoryView(this.testReocrd);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Test Record")
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Student ID".tr,
                    style: TextStyle(fontSize: 18),),
                    Text(testReocrd.studentId.toString(),
                    style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Student Name".tr,
                    style: TextStyle(fontSize: 18),),
                    Text(testReocrd.name.toString(),
                    style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Code".tr,
                    style: TextStyle(fontSize: 18),),
                    // Text(testReocrd.code.toString(),
                    // style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Level of Control".tr,
                    style: TextStyle(fontSize: 18),),
                    // Text(testReocrd.lvlCtrl.toString(),
                    // style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date of previous test".tr,
                    style: TextStyle(fontSize: 18),),
                    // Text(testReocrd.lastTestDate.toString(),
                    // style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => 
                      Text("Date of Test: " + DateFormat("dd-MM-yyyy")
                          .format(editTestRecordController.selectedDate.value)
                          .toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    MaterialButton(
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(20),
                      ),
                      height: screenHeight/25,
                      child: Text('Select Date'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white),
                      ),
                      onPressed: (){
                        editTestRecordController.chooseDate();
                      },
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minWidth: screenWidth / 1.1,
                  height: screenHeight / 18,
                  color: Colors.blue,
                  onPressed:() {
                      // editTestRecordController.editRecordDialog(testReocrd.testId.toString(), testReocrd.lastTestDate.toString());
                    },
                  child: Text("Update".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}