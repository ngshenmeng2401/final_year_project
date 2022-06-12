import 'package:final_year_project/pages/management/teacher/edit_student/edit_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditAge extends StatelessWidget {
  
  final editStudentDetailsController = Get.put(EditStudentDetailsController());
  final String age;
  final String id;
  EditAge(this.id, this.age);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    editStudentDetailsController.insertValue(age);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Age".tr),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Obx(() => MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: screenWidth/7,
                height: screenHeight/15,
                color: Colors.blue,
                onPressed: editStudentDetailsController.isUpdate.value == true
                ? (){
                  editStudentDetailsController.editStudentDialog(id,"age");
                }
                : null, 
                child: const Text("Edit",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),)
                ),
              )
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  autofocus: false,
                  onChanged: (value) => editStudentDetailsController.checkValue(age),
                  enableInteractiveSelection: true,
                  keyboardType: TextInputType.number,
                  controller: editStudentDetailsController.valueController,
                  decoration: InputDecoration(
                    hintText: "Age".tr,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}