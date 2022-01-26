import 'dart:io';

import 'package:final_year_project/pages/profile/profile_controller.dart';
import 'package:final_year_project/pages/profile/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String pathAsset='assets/images/profile.png';
    File? _image;

    return Scaffold(
      appBar:AppBar(
        title: Text('Profile',),
        backgroundColor: Colors.black,
      ),
      body:Center(
        child:Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:[
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                      child: Column(
                        children:<Widget>[
                          Container(
                            height:screenHeight/5.5,
                            width: screenWidth/2.5,
                            // color: Colors.black12,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                              height:screenHeight/3.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.black),
                                image: DecorationImage(
                                  image: AssetImage(pathAsset),
                                  fit: BoxFit.scaleDown,
                                )
                              ),
                            )
                          ),
                          Container(
                            padding:const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: Column(
                              children:[
                                Text("Username",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height:5),
                                Text("Email",
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height:5),
                                Text("Phone No",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ]
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children:[
                         ProfileMenu(
                          icon: Icon(Icons.person),
                          text: "Edit Profile",
                          press: (){
                          },
                        ),
                        ProfileMenu(
                          icon: Icon(Icons.lock),
                          text: "Change Password",
                          press: (){
                          },
                        ),
                        ProfileMenu(
                          icon: Icon(Icons.settings_outlined),
                          text: "Settings",
                          press: (){ 
                          },
                        ),
                        ProfileMenu(
                          icon: Icon(Icons.logout,color: Colors.red,),
                          text: "Logout",
                          press: (){
                            controller.logoutUser();
                          },
                          hasNavigation: false,
                        ),
                      ]
                    ),
                  ), 
                ]
              ),
            ),
        )
      )
    );
  }
}