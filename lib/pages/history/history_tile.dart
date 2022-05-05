import 'package:final_year_project/model/test_record.dart';
import 'package:final_year_project/pages/history/history_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestRecordTile extends StatelessWidget {
  
  final historyController = Get.put(HistoryController());
  final int index;
  final TestReocrd testReocrd;
  TestRecordTile(this.index, this.testReocrd);

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
            historyController.navigateEditHistoryView(testReocrd);
          },
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
            child: Text(' ${index + 1}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          title: Text(testReocrd.name.toString(),
            style: TextStyle(fontSize: 18),),
          subtitle: Text(testReocrd.id.toString(),),
          trailing: IconButton(
            onPressed: () {
              // teachermanageController.navigateEditStudentView(student);
            },
            icon: Icon(Icons.delete),
          ),
        )
      )
    );
  }
}