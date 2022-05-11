import 'package:final_year_project/pages/profile/change_password/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordView extends StatelessWidget {

  final changePasswordController = Get.put(ChangePasswordController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = appData.read("isDarkMode") ?? false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password", style: TextStyle(fontFamily: 'Arial')),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  height: screenHeight / 2,
                  width: screenWidth / 1.1,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(children: [
                            Text(
                              "Create A New Password",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Set your new password so you can login and access E-Tas",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ]),
                        ),
                        SizedBox(height: 40),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(
                                color: Colors.blue,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(children: [
                              TextField(
                                onChanged: (value){
                                  changePasswordController.checkForm();
                                },
                                controller:changePasswordController.currentPasswordController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue[600]!)),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.blue[400],
                                  ),
                                  labelText: 'Current Password',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Calibri',),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                onChanged: (value){
                                  changePasswordController.checkForm();
                                },
                                controller: changePasswordController.passwordController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:Colors.blue[600]!)),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.blue[400],
                                  ),
                                  labelText: 'New Password',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Calibri',),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextField(
                                onChanged: (value){
                                  changePasswordController.checkForm();
                                },
                                controller:changePasswordController.confirmPasswordController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue[600]!)),
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.blue[400],
                                  ),
                                  labelText: 'Confirm Password',
                                  labelStyle: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Calibri',),
                                ),
                              ),
                              SizedBox(height: 20),
                            ]),
                          ),
                        ),
                      ])),
              SizedBox(height: 30),
              Obx(() => MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                minWidth: screenWidth / 1.1,
                height: screenHeight / 18,
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 20,
                      color: isDarkMode == true ? Colors.white : Colors.black,
                      fontFamily: 'Arial'),
                ),
                onPressed: changePasswordController.isTyping.value == true
                ? () {
                  changePasswordController.changePasswordDialog();
                }
                : null,
                color: Colors.blue,
              )),
            ]),
          ),
        ),
      ),
    );
  }
}
