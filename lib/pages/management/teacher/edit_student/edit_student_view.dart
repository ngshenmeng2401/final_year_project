import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_profile_menu.dart';
import 'package:final_year_project/pages/management/teacher/edit_student/edit_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditStudentDetailsView extends StatelessWidget {

  final editStudentDetailsController = Get.put(EditStudentDetailsController());
  final Student student;
  EditStudentDetailsView(this.student);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar:AppBar(
        title: Text('Edit Details'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(5, 20, 5, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              EditProfileMenu(
                title: "Student Name",
                text: student.name.toString(),
                press: () => editStudentDetailsController.navigateEditName(student.id.toString(), student.name.toString()),
                height: screenHeight/13,
              ),
              SizedBox(height:5),
              EditProfileMenu(
                title: "Class",
                text: student.studentClass.toString(),
                press: () => editStudentDetailsController.navigateEditClass(student.id.toString(), student.studentClass.toString()),
                height: screenHeight/13,
              ),
              SizedBox(height:5),
              EditProfileMenu(
                title: "Age",
                text: student.age.toString(),
                press: () => editStudentDetailsController.navigateEditAge(student.id.toString(), student.age.toString()),
                height: screenHeight/13,
              ),
              SizedBox(height:5),
              EditProfileMenu(
                title: "Parent Id",
                text: student.parentId.toString(),
                press: () => editStudentDetailsController.navigateEditParentId(student.id.toString(), student.parentId.toString()),
                height: screenHeight/13,
              ),
              SizedBox(height:5),
              EditProfileMenu(
                title: "Phone No",
                text: student.phoneNo.toString(),
                press: () => editStudentDetailsController.navigateEditPhoneNo(student.id.toString(), student.phoneNo.toString()),
                height: screenHeight/13,
              ),
              Divider(
                height: 1,
                color: Colors.grey[100],
              )
            ],
          ),
        ),
      ),
    );
  }
}