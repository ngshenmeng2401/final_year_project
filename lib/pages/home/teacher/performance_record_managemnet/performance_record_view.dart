import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_controller.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/teacher_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class RecordListView extends StatelessWidget {

  final performanceRecordController = Get.put(PerformanceRecordController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String className = appData.read("className")??'';

    return Scaffold(
      appBar: AppBar(
        title: Text(className),
        actions: [
          IconButton(
            onPressed: (){

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
                        controller: performanceRecordController.searchRecordController,
                        onChanged: (value) {
                          performanceRecordController.checkTextField();
                        },
                        decoration: InputDecoration(
                          hintText: "Enter_Student_NameID".tr,
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
                          performanceRecordController.clearTextField();
                        },
                        icon: performanceRecordController.isSearching.value == true
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
                          performanceRecordController.searchRecord();
                        }, 
                        icon: Icon(Icons.search)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 15),
                height: screenHeight/1.3,
                child: ListView.builder(
                  itemCount: performanceRecordController.studentName.length, 
                  itemBuilder: (context, index) {
                    return TeacherRecordTile(index);
                  }, )
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        performanceRecordController.navigateAddDialog();
      },
      child: Icon(Icons.add),
      ),
    );
  }
}