import 'package:final_year_project/model/student.dart';
import 'package:final_year_project/pages/history/teacher/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentTestTile extends StatelessWidget {
  
  final historyController = Get.put(HistoryController());
  final int index;
  final Student student;
  StudentTestTile(this.index, this.student);

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
          onTap: (){
            historyController.navigateTestListView(student);
          },
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
            child: Text(' ${index + 1}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          title: Text(student.name.toString(),
            style: TextStyle(fontSize: 18),),
          subtitle: Text(student.id.toString(),),
          trailing: IconButton(
            onPressed: () {
            },
            icon: Icon(Icons.info_outline_rounded),
          ),
        )
      )
    );
  }
}