import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/pages/management/teacher/teacher_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentTile extends StatelessWidget {

  final teachermanageController = Get.put(TeacherManagementController());
  final int index;
  final Student student;
  StudentTile(this.index, this.student);
  
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
          onTap: (){
            teachermanageController.navigateEditStudentView(student);
          },
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
            child: Text(' ${index + 1}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          title: Text(student.name.toString(),
            style: TextStyle(fontSize: 18),),
          subtitle: Text(student.id.toString(),),
          trailing: IconButton(
            onPressed: () {
              teachermanageController.deleteStudentDetailsDialog(student.id.toString(), student.age.toString(), student.studentClass.toString());
            },
            icon: Icon(Icons.delete)
          ),
        )
      )
    );
  }
}