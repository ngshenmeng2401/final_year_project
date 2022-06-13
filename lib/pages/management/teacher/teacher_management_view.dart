import 'package:final_year_project/pages/management/teacher/student_tile.dart';
import 'package:final_year_project/pages/management/teacher/teacher_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TeacherManagementView extends GetView<TeacherManagementController> {

  final teachermanageController = Get.put(TeacherManagementController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = appData.read("isDarkMode") ?? false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Student List".tr),
          actions: [
            IconButton(
              onPressed: (){
                teachermanageController.sortStudentDialog();
              }, 
              icon: Icon(Icons.sort),)
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: screenWidth/1.1,
                  margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.blue),
                    // color: Colors.blue,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextField(
                          autofocus: false,
                          controller: teachermanageController.searchStudentController,
                          onChanged: (value) {
                            teachermanageController.checkTextField();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Student Name".tr,
                            border: InputBorder.none,
                            hintStyle: TextStyle(fontSize: 18),
                          ),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Obx(() => IconButton(
                          onPressed: () {
                            teachermanageController.clearTextField();
                          },
                          icon: teachermanageController.isSearching.value == true
                              ? Icon(Icons.clear)
                              : Icon(
                                  Icons.clear,
                                  color: Colors.transparent,),
                        )),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            teachermanageController.searchStudent();
                          }, 
                          icon: Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: screenHeight/1.4,
                  child: Obx(() {
                      if (controller.studentList.isEmpty) {
                        return Center(
                          child: Text(
                          controller.statusMsj.toString(),
                          style: const TextStyle(fontSize: 20),
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: controller.studentList.length, 
                          itemBuilder: (context, index) {
                            return StudentTile(index, teachermanageController.studentList[index]);
                        }, );
                      }
                  }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
        heroTag: "addStudent",
        onPressed: () {
          teachermanageController.navigateAddStudentView();
        },
        child: Icon(Icons.add,
          color: Colors.white,
        ),
        ),
      ),
    );
  }
}