import 'package:final_year_project/model/reading_record.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/add_record_controller.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/edit_record/edit_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class EditReadingQuestions extends StatelessWidget {

  final appData = GetStorage();
  final editPerformanceRecordController = Get.put(EditPerformanceRecordController());
  final ReadingRecord readingRecord;
  EditReadingQuestions(this.readingRecord);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    editPerformanceRecordController.chooseRQLevel(readingRecord.rq1.toString(), 0);
    editPerformanceRecordController.chooseRQLevel(readingRecord.rq2.toString(), 1);
    editPerformanceRecordController.chooseRQLevel(readingRecord.rq3.toString(), 2);
    editPerformanceRecordController.chooseRQLevel(readingRecord.rq4.toString(), 3);

    return Scaffold(
      appBar: AppBar(
        title: Text("Reading".tr),
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
                  Text(readingRecord.id.toString(),
                  style: TextStyle(fontSize: 18),),
                ],
              ),
              SizedBox(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Status".tr,
                  style: TextStyle(fontSize: 18),),
                  Text(readingRecord.seenstatus.toString(),
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
                      child: Text("Name letters of the alphabet.".tr,
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
                                value: _.levelRQ[0],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: readingRecord.seenstatus != "accepted"
                                ? (String? newValue) {
                                  _.chooseRQLevel(newValue!, 0);
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
                      child: Text("Read high frequency words.".tr,
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
                                value: _.levelRQ[1],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: readingRecord.seenstatus != "accepted" 
                                ? (String? newValue) {
                                  _.chooseRQLevel(newValue!, 1);
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
                      child: Text("3.")),
                    Expanded(
                      flex: 7,
                      child: Text("Read simple words.".tr,
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
                                value: _.levelRQ[2],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: readingRecord.seenstatus != "accepted" 
                                ? (String? newValue) {
                                  _.chooseRQLevel(newValue!, 2);
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
                      child: Text("4.")),
                    Expanded(
                      flex: 7,
                      child: Text("Read simple sentences.".tr,
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
                                value: _.levelRQ[3],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: readingRecord.seenstatus != "accepted"
                                ? (String? newValue) {
                                  _.chooseRQLevel(newValue!, 3);
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
                onPressed: readingRecord.seenstatus != "accepted"
                ? () {
                    editPerformanceRecordController.editRecordDialog("reading", readingRecord.id.toString());
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