import 'package:final_year_project/pages/management/teacher/edit_student/edit_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditClass extends StatelessWidget {

  final editStudentDetailsController = Get.put(EditStudentDetailsController());
  final String studentClass;
  final String id;
  EditClass(this.id, this.studentClass);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    editStudentDetailsController.chooseClass(studentClass);
    editStudentDetailsController.insertValue(studentClass);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Class".tr),
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
                editStudentDetailsController.editStudentDialog(id,"class");
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
              // TextField(
              //   enableInteractiveSelection: true,
              //   keyboardType: TextInputType.name,
              //   controller: editStudentDetailsController.valueController,
              //   decoration: InputDecoration(
              //     hintText: "Class".tr,
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Class", style: TextStyle(fontSize: 16)),
                  GetBuilder<EditStudentDetailsController>(
                    init: EditStudentDetailsController(),
                    builder: (_) {
                      return Container(
                        width: screenWidth/5,
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          value: _.selectClass,
                          elevation: 28,
                          style: const TextStyle(fontSize: 16, color: Colors.black),
                          onChanged: (String? newValue) {
                            _.chooseClass(newValue!);
                          },
                          items: [
                            for (var data in _.studentClass)
                              DropdownMenuItem(
                                child: new Text(
                                  data,
                                ),
                                value: data,
                              )
                          ]
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}