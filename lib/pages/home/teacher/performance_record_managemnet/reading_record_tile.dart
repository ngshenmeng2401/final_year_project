import 'package:final_year_project/model/reading_record.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingRecordTile extends StatelessWidget {

  final performanceRecordController = Get.put(PerformanceRecordController());
  final int index;
  final ReadingRecord readingRecord;
  ReadingRecordTile(this.index, this.readingRecord);

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
          title: Text(readingRecord.name.toString(),
            style: TextStyle(fontSize: 18),),
          subtitle: Text(readingRecord.id.toString(),),
          trailing: IconButton(
            onPressed: () {
              performanceRecordController.navigateEditReadingRecord(readingRecord);
            },
            icon: Icon(Icons.info),
          ),
        )
      )
    );
  }
}