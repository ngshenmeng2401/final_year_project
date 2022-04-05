import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PerformanceScoreTable extends StatelessWidget {

  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Table(
      border: TableBorder.all(
        color: isDarkMode == false ? Colors.black : Colors.white,
      ),
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container(
                height: screenHeight/32,
                child: Center(
                  child: Text("Level 1")
              )),
            ),
            TableCell(
              child: Container(
                height: screenHeight/32,
                child: Center(
                  child: Text("Level 2")
              )),
            ),
            TableCell(
              child: Container(
                height: screenHeight/32,
                child: Center(
                  child: Text("Level 3")
              )),
            ),
          ],
        ),
        TableRow(
          children: [
            TableCell(
              child: Container(
                height: screenHeight/32,
                child: Center(
                  child: Text("Poor".tr)
              )),
            ),
            TableCell(
              child: Container(
                height: screenHeight/32,
                child: Center(
                  child: Text("Moderate".tr)
              )),
            ),
            TableCell(
              child: Container(
                height: screenHeight/32,
                child: Center(
                  child: Text("Good".tr)
              )),
            ),
          ],
        ),
      ],
    );
  }
}