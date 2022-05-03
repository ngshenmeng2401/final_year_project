import 'package:final_year_project/model/speaking_record.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakingRecordTile extends StatelessWidget {

  final performanceRecordController = Get.put(PerformanceRecordController());
  final int index;
  final SpeakingRecord speakingRecord;
  SpeakingRecordTile(this.index, this.speakingRecord);

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
        padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
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
          title: Text(speakingRecord.name.toString(),
            style: TextStyle(fontSize: 18),),
          subtitle: Text(speakingRecord.id.toString(),),
          trailing: IconButton(
            onPressed: () {
              // performanceRecordController.navigateEditStudentView();
            },
            icon: Icon(Icons.edit),
          ),
        )
      )
    );
  }
}