import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.JPG",
            height: screenHeight/2,
            width: screenWidth/1.3,
            fit: BoxFit.fitWidth,),
            SizedBox(height:15),
            CircularProgressIndicator(),
            SizedBox(height:15),
            // Text("Loading".tr),
            Text("Loading"),
          ],
        ),
      )
    );
  }
}