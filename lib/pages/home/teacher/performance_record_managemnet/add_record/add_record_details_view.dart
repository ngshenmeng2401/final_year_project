import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/listening_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/reading_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/speaking_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/writing_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_controller.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_score_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddRecordDetailPage extends GetView<PerformanceRecordController> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Record Detail".tr),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PerformanceScoreTable(),
              SizedBox(height: screenHeight/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Student ID".tr,
                  style: TextStyle(fontSize: 22),),
                  GetBuilder<PerformanceRecordController>(
                    init: PerformanceRecordController(),
                    builder: (_) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: DropdownButton<String?>(
                          // dropdownColor: Colors.blue,
                          menuMaxHeight: screenHeight/4,
                          value: controller.selectName,
                          elevation: 28,
                          style: const TextStyle(fontSize: 20, color: Colors.black),
                          onChanged: (String? newValue) {
                            controller.chooseStudent(newValue!);
                          },
                          items: [
                            for (var data in controller.studentName)
                              DropdownMenuItem(
                                child: new Text(
                                  data,
                                ),
                                value: data,
                              )
                          ]
                        ));
                    },
                  ),
                ],
              ),
              Divider(),
              ListeningQuestions(),
              Divider(),
              SpeakingQuestions(),
              Divider(),
              ReadingQuestions(),
              Divider(),
              WritingQuestions(),
              Divider(),
              MaterialButton(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
                minWidth: screenWidth/1,
                height: screenHeight/18,
                child: Text('Submit'.tr,
                  style: TextStyle(fontSize: 20,),
                ),
                onPressed: (){
                  
                },
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}