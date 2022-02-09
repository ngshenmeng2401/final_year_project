import 'package:final_year_project/pages/home/parent/children_details.dart/children_details_controller.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/listening_result.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/reading_result.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/speaking_result.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/writing_result.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_score_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenDetailsView extends StatelessWidget {

  final childrenDetailsController = Get.put(ChildrenDetailsController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              PerformanceScoreTable(),
              SizedBox(height: screenHeight/30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth/4,
                    child: Text("Student ID:",
                      style: TextStyle(fontSize: 22),),
                  ),
                  Container(
                    width: screenWidth/2,
                    child: Text("274059",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 22),),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth/4,
                    child: Text("Name:",
                      style: TextStyle(fontSize: 22),),
                  ),
                  Container(
                    width: screenWidth/2,
                    child: Text("NG SHEN MENG",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 22),),
                  ),
                ],
              ),
              Divider(),
              ListeningResult(),
              SizedBox(height: 5),
              Divider(),
              SpeakingResult(),
              SizedBox(height: 5),
              Divider(),
              ReadingResult(),
              SizedBox(height: 5),
              Divider(),
              WritingResult(),
              SizedBox(height: 5),
              Divider(),
              MaterialButton(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
                minWidth: screenWidth/1,
                height: screenHeight/18,
                child: Text('Confirm',
                  style: TextStyle(fontSize: 20,),
                ),
                onPressed: (){
                  childrenDetailsController.confirmResult();
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