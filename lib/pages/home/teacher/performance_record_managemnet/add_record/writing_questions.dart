import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/add_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:group_button/group_button.dart';

class WritingQuestions extends StatelessWidget {

  final appData = GetStorage();
  final addRecordController = Get.put(AddRecordController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isDarkMode = appData.read("isDarkMode") ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Writing".tr),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Student ID".tr,
                  style: TextStyle(fontSize: 18),),
                  GetBuilder<AddRecordController>(
                    init: AddRecordController(),
                    builder: (_) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: DropdownButton<String?>(
                          // dropdownColor: Colors.blue,
                          menuMaxHeight: screenHeight/4,
                          value: _.selectName,
                          elevation: 28,
                          style: TextStyle(
                            fontSize: 18, 
                            color: isDarkMode == true ?Colors.white : Colors.black),
                          onChanged: (String? newValue) {
                            _.chooseStudent(newValue!);
                          },
                          items: [
                            // _.studentNameList.map((e) => {
                            //   return DropdownMenuItem();
                            // })
                            for (var data in _.studentNameList)
                              DropdownMenuItem(
                                child: new Text(
                                  data,
                                ),
                                value: data,
                              )
                          ]
                        ));
                    },
                  ),
                ],
              ),
              Divider(height: 30,),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Text("Level", 
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center),)
                ],
              ),
              SizedBox(height:20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text("1.")),
                    Expanded(
                      flex: 7,
                      child: Text("Write letters of alphabets.".tr,
                        style: const TextStyle(fontSize: 16),)),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: GetBuilder<AddRecordController>(
                          init: AddRecordController(),
                          builder: (_) {
                            return Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: isDarkMode == true ?Colors.white : Colors.black38, width:1),
                              ),
                              child: DropdownButton<String?>(
                                isExpanded: true,
                                // menuMaxHeight: screenHeight/5,
                                value: _.levelWQ[0],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: (String? newValue) {
                                  _.chooseWQLevel(newValue!, 0);
                                },
                                underline: Container(),
                                items: [
                                  for (var data in _.level)
                                    DropdownMenuItem(
                                      child: Center(
                                        child: Text(
                                          data,
                                        ),
                                      ),
                                      value: data,
                                    )
                                ]
                              ));
                            },
                          ),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text("2.")),
                    Expanded(
                      flex: 7,
                      child: Text("Write simple words.".tr,
                        style: const TextStyle(fontSize: 16),)),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: GetBuilder<AddRecordController>(
                          init: AddRecordController(),
                          builder: (_) {
                            return Container(
                              height: 35,
                              decoration: BoxDecoration(
                                border: Border.all(color: isDarkMode == true ?Colors.white : Colors.black38, width:1),
                              ),
                              child: DropdownButton<String?>(
                                isExpanded: true,
                                // menuMaxHeight: screenHeight/5,
                                value: _.levelWQ[1],
                                elevation: 28,
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: isDarkMode == true ?Colors.white : Colors.black),
                                onChanged: (String? newValue) {
                                  _.chooseWQLevel(newValue!, 1);
                                },
                                underline: Container(),
                                items: [
                                  for (var data in _.level)
                                    DropdownMenuItem(
                                      child: Center(
                                        child: Text(
                                          data,
                                        ),
                                      ),
                                      value: data,
                                    )
                                ]
                              ));
                            },
                          ),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              GetBuilder<AddRecordController>(
                init: AddRecordController(),
                builder: (_) {
                  return MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minWidth: screenWidth / 1.1,
                    height: screenHeight / 18,
                    color: Colors.black,
                    onPressed: addRecordController.selectName == "ID"
                    ? null
                    : () {
                        addRecordController.addRecordDialog("writing");
                      },
                    child: Text("Submit".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  );},
              ),
            ],
          ),
        ),
      ),
    );
  }
}