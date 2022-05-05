import 'package:final_year_project/model/classroom.dart';
import 'package:final_year_project/pages/home/teacher/teacher_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassTile extends StatelessWidget {


  final teacherhomeController = Get.put(TeacherHomeController());
  final int index;
  final Classroom classroom;
  ClassTile(this.index, this.classroom);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 2,
      child: InkWell(
        onTap: (){
          teacherhomeController.navigateRecordListPage(classroom);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                child: Text('${index+1}',
                  style: TextStyle(fontSize: 16),),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(classroom.age.toString() + " " + classroom.className.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text("( " + classroom.students.toString() + " )",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
            ],
          ),
        ),
      )
    );
  }
}