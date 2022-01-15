import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.jfif",
            scale: 0.6,),
            CircularProgressIndicator(color: Colors.black,),
            SizedBox(height:10),
            // Text("Loading".tr),
            Text("Loading"),
          ],
        ),
      )
    );
  }
}