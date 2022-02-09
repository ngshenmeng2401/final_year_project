import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ListeningResult extends StatelessWidget {

  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = appData.read("isDarkMode") ?? false;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      child: Column(
        children: [
          Text("Listening",style: const TextStyle(fontSize: 22),),
          SizedBox(height: 10),
          Table(
            columnWidths: {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(7.5),
              2: FlexColumnWidth(1.5),
            },
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
                        child: Text("1")
                    )),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Listen to and identify sounds in the enviroment.",)
                    )),
                  ),
                  TableCell(
                    child: Container(
                      height: screenHeight/32,
                      child: Center(
                        child: Text("5")
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
                        child: Text("2")
                    )),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Identify words with same beginning sounds.",)
                    )),
                  ),
                  TableCell(
                    child: Container(
                      height: screenHeight/32,
                      child: Center(
                        child: Text("5")
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
                        child: Text("3")
                    )),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Understand and follow simple instructions.",)
                    )),
                  ),
                  TableCell(
                    child: Container(
                      height: screenHeight/32,
                      child: Center(
                        child: Text("5")
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
                        child: Text("4")
                    )),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Understand meaning of simple words.",)
                    )),
                  ),
                  TableCell(
                    child: Container(
                      height: screenHeight/32,
                      child: Center(
                        child: Text("5")
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
                        child: Text("")
                    )),
                  ),
                  TableCell(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 5, 0, 5),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Total",)
                    )),
                  ),
                  TableCell(
                    child: Container(
                      height: screenHeight/32,
                      child: Center(
                        child: Text("25 / 25")
                    )),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}