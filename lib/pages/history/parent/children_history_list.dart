import 'package:final_year_project/pages/history/parent/children_history_controller.dart';
import 'package:final_year_project/pages/history/parent/children_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenHistoryList extends StatelessWidget {

  final childrenHistoryController = Get.put(ChildrenHistoryController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("Children Test Date".tr),
          backgroundColor: Colors.black,
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
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextField(
                          controller: childrenHistoryController.searchChildrenController,
                          onChanged: (value) {
                            childrenHistoryController.checkTextField();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Children Name/ID".tr,
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
                            childrenHistoryController.clearTextField();
                          },
                          icon: childrenHistoryController.isSearching.value == true
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
                            childrenHistoryController.searchChildren();
                          }, 
                          icon: Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (childrenHistoryController.childrenList.isEmpty) {
                    return Center(
                      child: Text(
                      childrenHistoryController.statusMsj.toString(),
                      style: const TextStyle(fontSize: 20),
                    ));
                  } else {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                      height: screenHeight/1.3,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10, 
                          childAspectRatio: (screenHeight / screenWidth) / 1.8,
                        ),
                        itemCount: childrenHistoryController.childrenList.length, 
                        itemBuilder: (context, index) {
                          return ChildrenHitoryTile(index, childrenHistoryController.childrenList[index]);
                        }, )
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