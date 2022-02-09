import 'package:final_year_project/pages/home/parent/parent_home_controller.dart';
import 'package:get/get.dart';

class ParentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentHomeController>(
      () => ParentHomeController(),
    );
  }
}