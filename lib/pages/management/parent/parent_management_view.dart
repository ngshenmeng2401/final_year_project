import 'package:final_year_project/pages/management/parent/children_tile.dart';
import 'package:final_year_project/pages/management/parent/parent_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentManagementView extends GetView<ParentManagementController> {

  final parentmanageController = Get.put(ParentManagementController());
  
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Children List".tr),
          actions: [
            IconButton(
              onPressed: (){
    
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
                          controller: parentmanageController.searchChildrenController,
                          onChanged: (value) {
                            parentmanageController.checkTextField();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Children Name".tr,
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
                            parentmanageController.clearTextField();
                          },
                          icon: parentmanageController.isSearching.value == true
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
                            parentmanageController.searchChildren();
                          }, 
                          icon: Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: screenHeight/1.25,
                  child: Obx(() {
                      if (controller.studentList.isEmpty) {
                        return Center(
                          child: Text(
                          controller.statusMsj.toString(),
                          style: const TextStyle(fontSize: 20),
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: controller.studentList.length, 
                          itemBuilder: (context, index) {
                            return ChildrenTile(index, parentmanageController.studentList[index]);
                        }, );
                      }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}