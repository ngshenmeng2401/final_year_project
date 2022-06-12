import 'package:final_year_project/pages/management/teacher/edit_student/edit_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditPhone extends StatelessWidget {
  
  final editStudentDetailsController = Get.put(EditStudentDetailsController());
  final String phoneNo;
  final String id;
  EditPhone(this.id, this.phoneNo);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    editStudentDetailsController.insertValue(phoneNo);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Phone".tr),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: screenWidth/7,
                height: screenHeight/15,
                color: Colors.blue,
                onPressed: (){
                  editStudentDetailsController.editStudentDialog(id,"phoneno");
                }, 
                child: const Text("Edit",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),)
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextField(
                  enableInteractiveSelection: true,
                  keyboardType: TextInputType.name,
                  controller: editStudentDetailsController.valueController,
                  decoration: InputDecoration(
                    hintText: "Phone".tr,
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