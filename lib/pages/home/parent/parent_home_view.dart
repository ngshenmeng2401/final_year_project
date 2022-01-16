import 'package:flutter/material.dart';

class ParentHomeView extends StatelessWidget {
  const ParentHomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Parent")
      ),
    );
  }
}