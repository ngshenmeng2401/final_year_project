import 'package:final_year_project/pages/management/teacher/teacher_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentTile extends StatelessWidget {

  final teachermanageController = Get.put(TeacherManagementController());
  final int index;
  StudentTile(this.index);
  
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        width: screenWidth,
        height: screenHeight/14,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
            child: Text(' ${index + 1}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          title: Text(teachermanageController.studentName[index],
            style: TextStyle(fontSize: 18),),
          subtitle: Text("274059",),
          trailing: IconButton(
            onPressed: () {
              teachermanageController.navigateEditStudentView();
            },
            icon: Icon(Icons.edit),
          ),
        )
      )
    );
  }
}