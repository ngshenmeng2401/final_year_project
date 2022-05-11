import 'package:final_year_project/pages/management/teacher/add_student/add_student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AddStudentDetailsView extends StatelessWidget {

  final addStudentDetailsController = Get.put(AddStudentDetailsController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = appData.read("isDarkMode") ?? false;

    return Scaffold(
      appBar:AppBar(
        title: Text('Add Details'.tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                autofocus: false,
                onChanged: (value) => addStudentDetailsController.checkStudentForm(),
                controller: addStudentDetailsController.studentNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Student Name'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Class", style: TextStyle(fontSize: 16)),
                  GetBuilder<AddStudentDetailsController>(
                    init: AddStudentDetailsController(),
                    builder: (_) {
                      return Container(
                        width: screenWidth/5,
                        child: DropdownButton<String?>(
                          isExpanded: true,
                          value: _.selectClass,
                          elevation: 28,
                          style: TextStyle(fontSize: 16, color: isDarkMode == true ?Colors.white : Colors.black),
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
              // SizedBox(height: 10),
              TextField(
                autofocus: false,
                onChanged: (value) => addStudentDetailsController.checkStudentForm(),
                controller: addStudentDetailsController.studentAgeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                autofocus: false,
                onChanged: (value) {
                  addStudentDetailsController.checkStudentForm();
                  addStudentDetailsController.checkParentId();
                },
                controller: addStudentDetailsController.parentIDController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Parent ID'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Obx(() =>Icon(Icons.error,
                    color: addStudentDetailsController.isUnder.value == true ? Colors.green : Colors.red,
                    size: 20,),
                  ),
                  
                  SizedBox(width: 10),
                  Obx(() =>Text("Parent Id must in 12 number !!!",
                    style:  TextStyle(
                      color: addStudentDetailsController.isUnder.value == true ? Colors.green : Colors.red,
                    ),),
                  ),
                ]
              ),
              SizedBox(height: 10),
              TextField(
                autofocus: false,
                onChanged: (value) {
                  addStudentDetailsController.checkPhoneNo();
                  addStudentDetailsController.checkStudentForm();
                },
                controller: addStudentDetailsController.phoneNoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone No'.tr,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Obx(() =>Icon(Icons.error,
                    color: addStudentDetailsController.isPhoneNumber.value == true ? Colors.green : Colors.red,
                    size: 20,),
                  ),
                  
                  SizedBox(width: 10),
                  Obx(() => addStudentDetailsController.isPhoneNumber.value == true
                  ? Text("Valid Phone Number",
                    style:  TextStyle(
                      color: Colors.green,
                    ),)
                  : Text("Invalid Phone Number",
                    style:  TextStyle(
                      color: Colors.red,
                    ),),
                  ),
                ]
              ),
              SizedBox(height: 15),
              Obx(() => MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: screenWidth / 1.1,
                height: screenHeight / 18,
                color: Colors.black,
                onPressed: addStudentDetailsController.isTyping.value == true
                  ? () {
                      addStudentDetailsController.addStudentDialog();
                    }
                  : null,
                  child: Text("Submit".tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}