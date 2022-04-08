import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/add_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ListeningQuestions extends StatelessWidget {

  final appData = GetStorage();
  final addRecordController = Get.put(AddRecordController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isDarkMode = appData.read("isDarkMode") ?? false;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Listening".tr,style: const TextStyle(fontSize: 22),),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: SizedBox()),
              Expanded(
                flex: 2,
                child: Text("Level", 
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center),)
            ],
          ),
          SizedBox(height:15),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("1.")),
                Expanded(
                  flex: 7,
                  child: Text("Listen to and identify sounds in the enviroment.".tr,
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
                            border: Border.all(color: Colors.black38, width:1),
                          ),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            // menuMaxHeight: screenHeight/5,
                            value: _.levelLQ[0],
                            elevation: 28,
                            style: const TextStyle(
                              fontSize: 16, 
                              color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseLQLevel(newValue!, 0);
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
          SizedBox(height: 15),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("2.")),
                Expanded(
                  flex: 7,
                  child: Text("Identify words with same beginning sounds.".tr,
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
                            border: Border.all(color: Colors.black38, width:1),
                          ),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            // menuMaxHeight: screenHeight/5,
                            value: _.levelLQ[1],
                            elevation: 28,
                            style: const TextStyle(
                              fontSize: 16, 
                              color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseLQLevel(newValue!, 1);
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
          SizedBox(height: 15),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("3.")),
                Expanded(
                  flex: 7,
                  child: Text("Understand and follow simple instructions.".tr,
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
                            border: Border.all(color: Colors.black38, width:1),
                          ),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            // menuMaxHeight: screenHeight/5,
                            value: _.levelLQ[2],
                            elevation: 28,
                            style: const TextStyle(
                              fontSize: 16, 
                              color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseLQLevel(newValue!, 2);
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
          SizedBox(height: 15),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Text("4.")),
                Expanded(
                  flex: 7,
                  child: Text("Understand meaning of simple words.".tr,
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
                            border: Border.all(color: Colors.black38, width:1),
                          ),
                          child: DropdownButton<String?>(
                            isExpanded: true,
                            // menuMaxHeight: screenHeight/5,
                            value: _.levelLQ[3],
                            elevation: 28,
                            style: const TextStyle(
                              fontSize: 16, 
                              color: Colors.black),
                            onChanged: (String? newValue) {
                              _.chooseLQLevel(newValue!, 3);
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
        ],
      ),
    );
  }
}