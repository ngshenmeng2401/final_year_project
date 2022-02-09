import 'package:final_year_project/pages/management/teacher/teacher_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditStudentDetailsView extends StatelessWidget {

  final teachermanageController = Get.put(TeacherManagementController());

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
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: teachermanageController.studentIDController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Student ID'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: teachermanageController.studentNameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: 'Student Name'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: teachermanageController.studentClassController,
                decoration: InputDecoration(
                  labelText: 'Class'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: teachermanageController.studentAgeController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Age'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: teachermanageController.parentIDController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Parent ID'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: teachermanageController.phoneNoController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone No'.tr,
                  labelStyle: TextStyle(
                  )
                ),
              ),
              SizedBox(height: 15),
              MaterialButton(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
                minWidth: screenWidth/1,
                height: screenHeight/18,
                child: Text('Update'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white),
                ),
                onPressed: (){
                  
                },
                color: Colors.black,
              ),
              SizedBox(height: 15),
              MaterialButton(
                shape:RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(20),
                ),
                minWidth: screenWidth/1,
                height: screenHeight/18,
                child: Text('Delete'.tr,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white),
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