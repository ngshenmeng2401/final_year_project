import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/pages/profile/remove_children.dart/remove_children_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenSlotTile extends StatelessWidget {
  
  final removeChildrenSlotController = Get.put(RemoveChildrenSlotController());
  final int index;
  final Children children;
  ChildrenSlotTile(this.index, this.children);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        width: screenWidth,
        height: screenHeight/14,
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
            child: Text(' ${index + 1}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          title: Text(children.name.toString(),
            style: TextStyle(fontSize: 18),),
          subtitle: Text(children.studentId.toString(),),
          trailing: IconButton(
            onPressed: () {
              removeChildrenSlotController.removeChildrenDialog(children);
            },
            icon: Icon(Icons.remove_circle_outline),
          ),
        )
      )
    );
  }
}