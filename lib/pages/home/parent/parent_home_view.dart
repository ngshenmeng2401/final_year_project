import 'package:final_year_project/pages/home/parent/children_tile.dart';
import 'package:final_year_project/pages/home/parent/parent_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParentHomeView extends GetView<ParentHomeController> {

  final parentHomeController = Get.put(ParentHomeController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:Text("Parent".tr),
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
                          controller: parentHomeController.searchChildrenController,
                          onChanged: (value) {
                            controller.checkTextField();
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
                            parentHomeController.clearTextField();
                          },
                          icon: controller.isSearching.value == true
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
                            parentHomeController.searchChildren();
                          }, 
                          icon: Icon(Icons.search)),
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (parentHomeController.childrenList.isEmpty) {
                    return Center(
                      child: Text(
                      parentHomeController.statusMsj.toString(),
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
                        itemCount: parentHomeController.childrenList.length, 
                        itemBuilder: (context, index) {
                          return ChildrenTile(index, parentHomeController.childrenList[index]);
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