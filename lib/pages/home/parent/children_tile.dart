import 'package:final_year_project/model/children.dart';
import 'package:final_year_project/pages/home/parent/parent_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChildrenTile extends StatelessWidget {

  final int index;
  final Children children;
  ChildrenTile(this.index, this.children);
  final parentHomeController = Get.put(ParentHomeController());

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 2,
      child: InkWell(
        onLongPress: (){
          parentHomeController.deleteRecordDialog(children.studentId.toString());
        },
        onTap: (){
          // parentHomeController.navigateChildrenDetailsPage(parentHomeController.childrenName[index]);
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                child: Text('${index+1}',
                  style: TextStyle(fontSize: 16),),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(children.name.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Icon(Icons.info_outline_rounded,
                      size: 30,),
                  ],
                )),
              
            ],
          ),
        ),
      )
    );
  }
}