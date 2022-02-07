import 'package:final_year_project/pages/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign Up",
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
                    border: Border.all(color: Colors.black),
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
                            // "Email".tr,
                            "Email",
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
                            // "User_Name".tr,
                            "User_Name",
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
                            // "Phone_No".tr,
                            "Phone_No",
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
                            // "Password".tr,
                            "Password",
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
                            // "Confirm_Password".tr,
                            "Confirm_Password",
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
                            // "Referral_Code".tr,
                            "Referral_Code",
                            icon: Icon(Icons.security,),
                            ),
                          obscureText: true,
                        )
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(20,0,20,15),
                        child: RichText(
                          text: TextSpan(
                            children: const <TextSpan>[
                              TextSpan(text: "* Only"),
                              TextSpan(text: " teacher", style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: " and"),
                              TextSpan(text: " staff", style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: " need to key in referral code,"),
                              TextSpan(text: " parent", style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: " just key in"),
                              TextSpan(text: " ' - '. ", style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        )
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
                  color: Colors.black,
                  onPressed: (){
                    controller.signUpDialog();
                  },
                  child: Text(
                    // "Sign_Up".tr,
                    "Sign_Up",
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
                      // "Already_have_an_account".tr,
                      "Already_have_an_account",
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
                        // "Login".tr,
                        "Login",
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