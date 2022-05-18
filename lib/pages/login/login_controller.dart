import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/user_remote_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{

  final GlobalKey <FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController emailController, passwordController, forgotPasswordEmailController;

  final appData = GetStorage(); 

  var email = '';
  var password = '';
  var rememberMe = false;
  var selectPosition = "Parent";
  final List<String> position = ["Parent", "Staff"];

  @override
  void onInit() {

    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    forgotPasswordEmailController = TextEditingController();
    loadPreference();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void navigateSignUpView(){

    Get.offNamed(AppRoutes.Signup);
  }

  void choosePosition(value){
     selectPosition = value;
     print(selectPosition);
     update();
     storePosition(selectPosition);
  }

  void storePosition(position){

    appData.write("position", position);
  }

  void rememberEmailPassword (value, email, password, position){

    print(position);

    if(email.isEmpty || password.isEmpty){

      Get.snackbar(
        "Error","Email_Password_is_empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      return;
    }
    // print(rememberMe);
    rememberMe = value;
    print(rememberMe);
    storePreference(value, email, password, position);
    update();
  }

  Future<void> storePreference(bool value,String email, String password, String position) async {
    
    if(value==true){

      appData.write("email", email);
      appData.write("password", password);
      appData.write("rememberme", value);

      Get.snackbar(
        "Message","Email_Password_stored",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
    return;
    }else{  
      
      appData.write("email", '');
      appData.write("password", '');
      appData.write("rememberme", value);

      Get.snackbar(
        "Message","Removed_Email_Password",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );
      emailController.text = "";
      passwordController.text = "";
      rememberMe = false ;
      update();
      return;
    }
  }

  Future<void> loadPreference()async {

    String email = appData.read("email")??'';
    String password = appData.read("password")??'';
    String? loadPosition = appData.read("position")??'';
    rememberMe= (appData.read("rememberme")??false);

    emailController.text=email;
    passwordController.text=password;
    selectPosition = loadPosition;
    update();
  }

  void forgotPasswordDialog(){

    Get.defaultDialog(
      title: "Forgot_Your_Password".tr,
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15,0,15,0),
            child: TextField(
              controller: forgotPasswordEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email".tr
              ),
            ),
          )
        ],
      ),
      textConfirm: "Submit".tr,
      textCancel: "Cancel".tr,
      onConfirm:() => Get.back(),
      onCancel: () => Get.back(),
      cancelTextColor: Colors.black,
      confirmTextColor: Colors.white,
      buttonColor: Colors.black,
    );
  }

  void loginUser(){

    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    if(email.isEmpty){

      Get.snackbar(
        "Error","Email_Password_is_empty",
        backgroundColor: Colors.white60,
        colorText: Colors.black,
        icon: Icon(Icons.error, color: Colors.black),
        snackPosition: SnackPosition.TOP,  
      );

    }else{

      UserRemoteServices.loginUser(emailController.text.toString(), passwordController.text.toString(), selectPosition);
    
    }
  }
}