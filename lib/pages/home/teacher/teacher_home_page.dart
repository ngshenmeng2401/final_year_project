import 'package:flutter/material.dart';

class TeacherHomeView extends StatelessWidget {
  const TeacherHomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher"),
        backgroundColor: Colors.black,
      )
    );
  }
}