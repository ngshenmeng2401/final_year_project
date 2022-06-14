import 'package:final_year_project/pages/history/teacher/add_test_date/add_history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddHistoryView extends StatelessWidget {

  final addHistoryController = Get.put(AddHistoryCOntroller());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Test Record")
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Student ID".tr,
                    style: TextStyle(fontSize: 18),),
                    GetBuilder<AddHistoryCOntroller>(
                      init: AddHistoryCOntroller(),
                      builder: (_) {
                        return Container(
                          width: screenWidth/2.5,
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            menuMaxHeight: screenHeight/4,
                            value: _.selectName,
                            elevation: 28,
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseStudent(newValue!);
                            },
                            items: [
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Code".tr,
                    style: TextStyle(fontSize: 18),),
                    GetBuilder<AddHistoryCOntroller>(
                      init: AddHistoryCOntroller(),
                      builder: (_) {
                        return Container(
                          width: screenWidth/5,
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            menuMaxHeight: screenHeight/4,
                            value: _.selectCode,
                            elevation: 28,
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseCode(newValue!);
                            },
                            items: [
                              for (var data in _.codeList)
                                DropdownMenuItem(
                                  child: new Text(
                                    data,
                                    textAlign: TextAlign.center,
                                  ),
                                  value: data,
                                )
                            ]
                          ));
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Level of Control".tr,
                    style: TextStyle(fontSize: 18),),
                    GetBuilder<AddHistoryCOntroller>(
                      init: AddHistoryCOntroller(),
                      builder: (_) {
                        return Container(
                          width: screenWidth/5,
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            menuMaxHeight: screenHeight/4,
                            value: _.selectLevel,
                            elevation: 28,
                            style: const TextStyle(fontSize: 18, color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseLevel(newValue!);
                            },
                            items: [
                              for (var data in _.levelList)
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
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => 
                      Text("Date of Test: " + DateFormat("dd-MM-yyyy")
                          .format(addHistoryController.selectedDate.value)
                          .toString(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    MaterialButton(
                      shape:RoundedRectangleBorder(
                        borderRadius:BorderRadius.circular(20),
                      ),
                      height: screenHeight/25,
                      child: Text('Select Date'.tr,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white),
                      ),
                      onPressed: (){
                        addHistoryController.chooseDate();
                      },
                      color: Colors.blue,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                GetBuilder<AddHistoryCOntroller>(
                  init: AddHistoryCOntroller(),
                  builder: (_) {
                    return 
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minWidth: screenWidth / 1.1,
                      height: screenHeight / 18,
                      color: Colors.blue,
                      onPressed: addHistoryController.selectName == "ID"
                      ? null
                      : () {
                          addHistoryController.addRecordDialog();
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
      ),
    );
  }
}