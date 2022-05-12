import 'package:final_year_project/pages/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpView extends GetView<SignUpController> {

  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = appData.read("isDarkMode") ?? false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign Up".tr,
          style:TextStyle(
            fontSize:24
          )),
      ),
      body:SingleChildScrollView(
        child: Center(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(25,40,25,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.JPG',
                  height: screenHeight / 4,
                  width: screenWidth / 1.1,),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue[400]!),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: 
                            "Email".tr,
                            icon: Icon(Icons.email,)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          keyboardType: TextInputType.name,
                          controller: controller.userNameController,
                          decoration: InputDecoration(
                            labelText: 
                            "User Name".tr,
                            icon: Icon(Icons.people,)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneNoController,
                          decoration: InputDecoration(
                            labelText: 
                            "Phone No".tr,
                            icon: Icon(Icons.phone,)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: 
                            "Password".tr,
                            icon: Icon(Icons.lock,)
                          ),
                            obscureText: true,
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          controller: controller.confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 
                            "Confirm Password".tr,
                            icon: Icon(Icons.lock,),
                            ),
                          obscureText: true,
                        )
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,15),
                        child: TextField(
                          controller: controller.referralCodeController,
                          decoration: InputDecoration(
                            labelText: 
                            "Referral Code".tr,
                            icon: Icon(Icons.security,),
                            ),
                          obscureText: true,
                        )
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(20,0,20,15),
                        child: Text("* Only teacher and staff need to key in referral code, parent just key in ' - '. ".tr,
                          textAlign: TextAlign.justify,)
                      ),
                    ],
                  ),
                ),
                SizedBox(height:15),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight/18,
                  minWidth: screenWidth/1.1,
                  color: isDarkMode == true ? Colors.blue[400] : Colors.blue,
                  onPressed: (){
                    controller.signUpDialog();
                  },
                  child: Text(
                    "Sign Up".tr,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                    )),
                ),
                SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account".tr,
                      style: TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      )),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        controller.navigateLoginView();
                      },
                      child: Text(
                        "Login".tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                    )
                  ],
                )
              ],
            ),
          )
        ),
      )
    );
  }
}