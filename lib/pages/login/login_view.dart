import 'package:final_year_project/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login", style: TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                child: Image.asset(
                  'assets/images/logo.JPG',
                  height: screenHeight / 4,
                  width: screenWidth / 1.1,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  children: [
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (_) {
                        return ListTile(
                          leading: Icon(
                            Icons.email,
                          ),
                          title: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _.emailController,
                            decoration: InputDecoration(
                              // labelText: "Email".tr,
                              labelText: "Email",
                            ),
                          ),
                        );
                      },
                    ),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (_) {
                        return ListTile(
                          leading: Icon(
                            Icons.lock,
                          ),
                          title: TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _.passwordController,
                            decoration: InputDecoration(
                              // labelText: "Email".tr,
                              labelText: "Password",
                            ),
                          ),
                        );
                      },
                    ),
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (_) {
                        return ListTile(
                          leading: Icon(
                            Icons.person,
                          ),
                          title: Text("Position"),
                          trailing: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              child: DropdownButton<String?>(
                                value: controller.selectPosition,
                                elevation: 28,
                                style: const TextStyle(fontSize: 20),
                                onChanged: (String? newValue) {
                                  controller.choosePosition(newValue!);
                                },
                                items: [
                                  for (var data in controller.position)
                                    DropdownMenuItem(
                                      child: new Text(
                                        data,
                                      ),
                                      value: data,
                                    )
                                ]
                              )),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (controller) {
                          return Checkbox(
                              value: controller.rememberMe,
                              activeColor: Colors.black,
                              onChanged: (value) {
                                controller.rememberEmailPassword(
                                    value!,
                                    controller.emailController.text.toString(),
                                    controller.passwordController.text.toString(),
                                    controller.selectPosition,
                                );
                              });
                        },
                      ),
                      // Text("Remember_Me".tr),
                      Text("Remember_Me", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        // controller.forgotPasswordDialog();
                      },
                      child: Text(
                        // "Forgot_Password".tr,
                        "Forgot_Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: screenWidth / 1.1,
                  height: screenHeight / 18,
                  color: Colors.black,
                  onPressed: () {
                    controller.loginUser();
                  },
                  child: Text("Login",
                      // "Login".tr,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ?",
                          style: TextStyle(fontSize: 16)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            controller.navigateSignUpView();
                          },
                          child: Text(
                            // "Sign Up".tr,
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
