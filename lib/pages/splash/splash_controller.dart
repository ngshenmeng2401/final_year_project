import 'dart:async';

import 'package:final_year_project/route/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  // final appData = GetStorage();

  @override
  void onReady() {
    // appData.writeIfNull('isLogged', false);
    super.onReady();
    loading();
  }

  Future<void> loading() async {

    Timer(Duration(seconds: 3), () {

      // appData.read('isLogged') ? Get.offAllNamed(AppRoutes.BottomNavigation) : 
      Get.offAllNamed(AppRoutes.Login);
    }
    
    );
  }
}