import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/pages/history/parent/test_date_list.dart/test_date_controller.dart';
import 'package:final_year_project/pages/history/parent/test_date_list.dart/test_date_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestDateView extends StatelessWidget {
  
  final Children children;
  TestDateView(this.children);
  final testDateController = Get.put(TestDateController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(children.name.toString()),
          actions: [
            IconButton(
              onPressed: (){
                testDateController.sortTestRecordDialog();
              }, 
              icon: Icon(Icons.sort),)
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Obx(() {
                    if (testDateController.testRecordList.isEmpty) {
                      return Center(
                        child: Text(
                        testDateController.statusMsj.toString(),
                        style: const TextStyle(fontSize: 20),
                      ));
                    } else {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                        height: screenHeight/1.3,
                        child: ListView.builder(
                          itemCount: testDateController.testRecordList.length, 
                          itemBuilder: (context, index) {
                            return TestDateTile(index, testDateController.testRecordList[index]);
                        },)
                      );
                    }
                  }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}