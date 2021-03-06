import 'package:final_year_project/pages/history/teacher/history_controller.dart';
import 'package:final_year_project/pages/history/teacher/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryView extends StatelessWidget {

  final historyController = Get.put(HistoryController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = appData.read("isDarkMode") ?? false;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test Date List"),
          actions: [
            IconButton(
              onPressed: (){
                historyController.sortTestRecordDialog();
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
                          controller: historyController.searchNameController,
                          onChanged: (value) {
                            historyController.checkTextField();
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
                            historyController.clearTextField();
                            historyController.loadStudentList();
                          },
                          icon: historyController.isSearching.value == true
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
                            historyController.searchStudentList();
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
                      if (historyController.studentList.isEmpty) {
                        return Center(
                          child: Text(
                          historyController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 20),
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: historyController.studentList.length, 
                          itemBuilder: (context, index) {
                            return StudentTestTile(index, historyController.studentList[index]);
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
          historyController.navigateAddHistoryView();
        },
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}