import 'package:final_year_project/pages/home/parent/children_details.dart/children_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SpeakingResult extends StatelessWidget {

  final appData = GetStorage();
  final childrenDetailsController = Get.put(ChildrenDetailsController());

  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Speaking".tr,style: const TextStyle(fontSize: 22),)
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
                  Container(
                    width: screenWidth/2,
                    child: Text("274059",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 22),),
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
                  Container(
                    width: screenWidth/2,
                    child: Text("NG SHEN MENG",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 22),),
                  ),
                ],
              ),
              Divider(),
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
                            child: Text("1")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Use simple words.".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("5")
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
                            child: Text("2")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Use simple statements.".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("5")
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
                            child: Text("3")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Ask simple questions.".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("5")
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
                            child: Text("4")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Sing/recite songs, rhymes, poems.".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("5")
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
                            child: Text("5")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Tell simple stories.".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("5")
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
                            child: Text("")
                        )),
                      ),
                      TableCell(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Total".tr,)
                        )),
                      ),
                      TableCell(
                        child: Container(
                          height: screenHeight/32,
                          child: Center(
                            child: Text("25/25")
                        )),
                      ),
                    ],
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