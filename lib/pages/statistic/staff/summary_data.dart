import 'package:final_year_project/pages/statistic/staff/statstic_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummaryData extends StatelessWidget {

  final statisticsController = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return AspectRatio(
      aspectRatio: 1.4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Summary Data",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20),),
          SizedBox(height:10),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red[400],
                    ),
                    height: screenHeight/8,
                    child: Center(
                      child: Obx(() {
                        if (statisticsController.summaryDataList.isEmpty) {
                          return Text(
                          statisticsController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 22, color: Colors.white),
                          );
                        } else {
                          return Text("Total Student\n" + statisticsController.totalStudent.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white));
                        }
                      }),
                    ),
                ),
              ),),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 8,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.yellow[700],
                    ),
                    height: screenHeight/8,
                    child: Center(
                      child: Obx(() {
                        if (statisticsController.summaryDataList.isEmpty) {
                          return Text(
                          statisticsController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 22, color: Colors.white),
                          );
                        } else {
                          return Text("Total Class\n" + statisticsController.totalClass.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white));
                        }
                      }),
                    ),
                  ),
              ),),
            ],
          ),
          SizedBox(height:10),
          Row(
            children: [
              Expanded(
                flex: 8,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green[600],
                    ),
                    height: screenHeight/8,
                    child: Center(
                      child: Obx(() {
                        if (statisticsController.summaryDataList.isEmpty) {
                          return Text(
                          statisticsController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 22, color: Colors.white),
                          );
                        } else {
                          return Text("Total Record\n" + statisticsController.totalRecord.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white));
                        }
                      }),
                    ),
                  ),
                ),),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 8,
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[600],
                    ),
                    height: screenHeight/8,
                    child: Center(
                      child: Obx(() {
                        if (statisticsController.summaryDataList.isEmpty) {
                          return Text(
                          statisticsController.statusMsj.toString(),
                          style: const TextStyle(fontSize: 22, color: Colors.white),
                          );
                        } else {
                          return Text("Total Parent\n" + statisticsController.totalParent.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.white));
                        }
                      }),
                    ),
                  ),
                ),),
            ],
          )
        ],
      ),
    );
  }
}