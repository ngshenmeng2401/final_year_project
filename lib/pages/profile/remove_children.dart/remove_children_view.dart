import 'package:final_year_project/pages/profile/remove_children.dart/children_slot_tile.dart';
import 'package:final_year_project/pages/profile/remove_children.dart/remove_children_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemoveChildrenSlotView extends StatelessWidget {

  final removeChildrenSlotController = Get.put(RemoveChildrenSlotController());
  RemoveChildrenSlotView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Remove Children Slot"),
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
                          controller: removeChildrenSlotController.searchChildrenController,
                          onChanged: (value) {
                            removeChildrenSlotController.checkTextField();
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
                            removeChildrenSlotController.clearTextField();
                          },
                          icon: removeChildrenSlotController.isSearching.value == true
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
                            removeChildrenSlotController.searchChildren();
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
                      if (removeChildrenSlotController.childrenList.isEmpty) {
                        return Center(
                          child: Text(
                          removeChildrenSlotController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 20),
                        ));
                      } else {
                        return ListView.builder(
                          itemCount: removeChildrenSlotController.childrenList.length, 
                          itemBuilder: (context, index) {
                            return ChildrenSlotTile(index, removeChildrenSlotController.childrenList[index]);
                        }, );
                      }
                  }),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}