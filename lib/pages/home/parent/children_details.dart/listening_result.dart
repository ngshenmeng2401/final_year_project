import 'package:final_year_project/pages/home/parent/children_details.dart/children_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ListeningResult extends StatelessWidget {

  final appData = GetStorage();
  final childrenDetailsController = Get.put(ChildrenDetailsController());

  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Listening".tr,style: const TextStyle(fontSize: 22),)
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth/4,
                    child: Text("Student ID:".tr,
                      style: TextStyle(fontSize: 22),),
                  ),
                  Obx(() => 
                    Container(
                      width: screenWidth/2,
                      child: Text(childrenDetailsController.studentID.value,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 22),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth/4,
                    child: Text("Name:".tr,
                      style: TextStyle(fontSize: 22),),
                  ),
                  Obx(() => 
                    Container(
                      width: screenWidth/2,
                      child: Text(childrenDetailsController.studentName.value,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 22),),
                    ),
                  ),
                ],
              ),
              Divider(
                height: screenHeight/20,
              ),
              Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(7.5),
                  2: FlexColumnWidth(1.5),
                },
                border: TableBorder.all(
                  color: isDarkMode == false ? Colors.black : Colors.white,
                ),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("No".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Details".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("Level")
                        )),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("1")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Listen to and identify sounds in the enviroment.".tr,)
                        )),
                      ),
                      Obx(() =>
                        TableCell(
                          child: Container(
                            height: screenHeight/32,
                            child: Center(
                              child: Text(childrenDetailsController.result1.value)
                          )),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("2")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Identify words with same beginning sounds.".tr,)
                        )),
                      ),
                      Obx(() =>
                        TableCell(
                          child: Container(
                            height: screenHeight/32,
                            child: Center(
                              child: Text(childrenDetailsController.result2.value)
                          )),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("3")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Understand and follow simple instructions.".tr,)
                        )),
                      ),
                      Obx(() =>
                        TableCell(
                          child: Container(
                            height: screenHeight/32,
                            child: Center(
                              child: Text(childrenDetailsController.result3.value)
                          )),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("4")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Understand meaning of simple words.".tr,)
                        )),
                      ),
                      Obx(() =>
                        TableCell(
                          child: Container(
                            height: screenHeight/32,
                            child: Center(
                              child: Text(childrenDetailsController.result4.value)
                          )),
                        ),
                      ),
                    ],
                  ),
                  // TableRow(
                  //   children: [
                  //     TableCell(
                  //       child: Container(
                  //         height: screenHeight/32,
                  //         child: Center(
                  //           child: Text("")
                  //       )),
                  //     ),
                  //     TableCell(
                  //       child: Container(
                  //         padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                  //         child: Align(
                  //           alignment: Alignment.centerLeft,
                  //           child: Text("Total".tr)
                  //       )),
                  //     ),
                  //     TableCell(
                  //       child: Container(
                  //         height: screenHeight/32,
                  //         child: Center(
                  //           child: Text("25 / 25")
                  //       )),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}