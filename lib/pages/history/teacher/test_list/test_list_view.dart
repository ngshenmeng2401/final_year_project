import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/pages/history/teacher/test_list/test_list_controller.dart';
import 'package:final_year_project/pages/history/teacher/test_list/test_record_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TestListView extends StatelessWidget {

  final testListController = Get.put(TestListController());
  final Student student;
  final appData = GetStorage();
  TestListView(this.student);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test Date List (" + student.name.toString() + ")",
            overflow: TextOverflow.ellipsis,),
          actions: [
            IconButton(
              onPressed: (){
                testListController.sortTestRecordDialog();
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
                          controller: testListController.searchCodeController,
                          onChanged: (value) {
                            testListController.checkTextField();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Code".tr,
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
                            testListController.clearTextField();
                            testListController.loadTestList();
                          },
                          icon: testListController.isSearching.value == true
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
                            // testListController.searchTestRecord();
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
                      if (testListController.testReocrdList.isEmpty) {
                        return Center(
                          child: Text(
                          testListController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 20),
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: testListController.testReocrdList.length, 
                          itemBuilder: (context, index) {
                            return TestRecordTile(index, testListController.testReocrdList[index]);
                        }, );
                      }
                  }),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
        heroTag: "addRecord",
        onPressed: () {
          testListController.navigateAddHistoryView();
        },
        child: Icon(Icons.add),
        ),
      )
    );
  }
}