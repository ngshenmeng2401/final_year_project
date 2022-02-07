import 'package:final_year_project/pages/profile/settings/settings_controller.dart';
import 'package:get/get.dart';

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );
  }
}