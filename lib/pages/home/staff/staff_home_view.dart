import 'package:flutter/material.dart';

class StaffHomeView extends StatelessWidget {
  const StaffHomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staff"),
        backgroundColor: Colors.black,
      )
    );
  }
}