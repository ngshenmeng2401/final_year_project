import 'package:final_year_project/route/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  void logoutUser(){

    // appData.write('isLogged', false);
    // appData.remove('keepLogin');
    
    Get.offNamedUntil(AppRoutes.Login, (route) => false);
  }
}