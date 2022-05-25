import 'package:final_year_project/model/writing_record.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/edit_record/edit_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditWritingQuestions extends StatelessWidget {

  final appData = GetStorage();
  final editPerformanceRecordController = Get.put(EditPerformanceRecordController());
  final WritingRecord writingRecord;
  EditWritingQuestions(this.writingRecord);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    editPerformanceRecordController.chooseWQLevel(writingRecord.wq1.toString(), 0);
    editPerformanceRecordController.chooseWQLevel(writingRecord.wq2.toString(), 1);

    return Scaffold(
      appBar: AppBar(
        title: Text("Writing".tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Student ID".tr,
                  style: TextStyle(fontSize: 18),),
                  Text(writingRecord.id.toString(),
                  style: TextStyle(fontSize: 18),),
                ],
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Status".tr,
                  style: TextStyle(fontSize: 18),),
                  Text(writingRecord.seenstatus.toString(),
                  style: TextStyle(fontSize: 18),),
                ],
              ),
              Divider(height: 30,),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Text("Level", 
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),)
                ],
              ),
              SizedBox(height:20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text("1.")),
                    Expanded(
                      flex: 7,
                      child: Text("Write letters of alphabets.".tr,
                        style: const TextStyle(fontSize: 16),)),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: GetBuilder<EditPerformanceRecordController>(
                          init: EditPerformanceRecordController(),
                          builder: (_) {
                            return Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: isDarkMode == true ?Colors.white : Colors.black38, width:1),
                              ),
                              child: DropdownButton<String?>(
                                isExpanded: true,
                                // menuMaxHeight: screenHeight/5,
                                value: _.levelWQ[0],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: writingRecord.seenstatus != "accepted"
                                ? (String? newValue) {
                                  _.chooseWQLevel(newValue!, 0);
                                }
                                : null,
                                underline: Container(),
                                items: [
                                  for (var data in _.level)
                                    DropdownMenuItem(
                                      child: Center(
                                        child: Text(
                                          data,
                                        ),
                                      ),
                                      value: data,
                                    )
                                ]
                              ));
                            },
                          ),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text("2.")),
                    Expanded(
                      flex: 7,
                      child: Text("Write simple words.".tr,
                        style: const TextStyle(fontSize: 16),)),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: GetBuilder<EditPerformanceRecordController>(
                          init: EditPerformanceRecordController(),
                          builder: (_) {
                            return Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: isDarkMode == true ?Colors.white : Colors.black38, width:1),
                              ),
                              child: DropdownButton<String?>(
                                isExpanded: true,
                                // menuMaxHeight: screenHeight/5,
                                value: _.levelWQ[1],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: writingRecord.seenstatus != "accepted"
                                ? (String? newValue) {
                                  _.chooseWQLevel(newValue!, 1);
                                }
                                : null,
                                underline: Container(),
                                items: [
                                  for (var data in _.level)
                                    DropdownMenuItem(
                                      child: Center(
                                        child: Text(
                                          data,
                                        ),
                                      ),
                                      value: data,
                                    )
                                ]
                              ));
                            },
                          ),),
                    )
                  ],
                ),
              ),
              Divider(height: 30,),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minWidth: screenWidth / 1.1,
                height: screenHeight / 18,
                color: Colors.black,
                onPressed: writingRecord.seenstatus != "accepted"
                ? () {
                    editPerformanceRecordController.editRecordDialog("writing", writingRecord.id.toString());
                  }
                : null,
                child: Text("Update".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}