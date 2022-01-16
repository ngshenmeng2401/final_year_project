import 'package:final_year_project/pages/home/home_controller.dart';
import 'package:final_year_project/pages/profile/profile_controller.dart';
import 'package:final_year_project/widget/bottom_navigation_bar_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavigationBarController>(() => BottomNavigationBarController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    // Get.lazyPut<SearchController>(() => SearchController());
  }
}