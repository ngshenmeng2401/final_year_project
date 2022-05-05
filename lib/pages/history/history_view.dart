import 'package:final_year_project/pages/history/history_controller.dart';
import 'package:final_year_project/pages/history/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {

  final historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
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
                          hintText: "Enter_Class_Name".tr,
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
                          historyController.loadTestRecordList();
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
                          historyController.searchTestRecord();
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
                    if (historyController.testReocrdList.isEmpty) {
                      return Center(
                        child: Text(
                        historyController.statusMsj.toString(),
                        style: const TextStyle(fontSize: 20),
                      ));
                    } else {
                      return ListView.builder(
                        itemCount: historyController.testReocrdList.length, 
                        itemBuilder: (context, index) {
                          return TestRecordTile(index, historyController.testReocrdList[index]);
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
    );
  }
}