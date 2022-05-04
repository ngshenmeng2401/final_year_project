import 'package:flutter/material.dart';

class HistoryTile extends StatelessWidget {
  
  final int index;
  final String historyList;
  HistoryTile(this.index, this.historyList);

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
          title: Text(historyList.toString(),
            style: TextStyle(fontSize: 18),),
          // subtitle: Text(student.id.toString(),),
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