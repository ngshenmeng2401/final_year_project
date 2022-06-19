import 'package:final_year_project/model/test_record.dart';
import 'package:flutter/material.dart';

class TestDateTile extends StatelessWidget {
  
  final int index;
  final TestRecord testRecord;
  TestDateTile(this.index, this.testRecord);

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
        height: screenHeight/8,
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(' ${index + 1}',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Code:",
                        style: TextStyle(fontSize: 16),),
                        Text(testRecord.code.toString(),
                        style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Level of Control:",
                        style: TextStyle(fontSize: 16),),
                        Text(testRecord.lvlCtrl.toString(),
                        style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Previous test date:",
                        style: TextStyle(fontSize: 16),),
                        Text(testRecord.lastTestDate.toString(),
                        style: TextStyle(fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Last test date:",
                        style: TextStyle(fontSize: 16),),
                        Text(testRecord.lastTestDate.toString(),
                        style: TextStyle(fontSize: 16),),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
          ],
        )
      )
    );
  }
}