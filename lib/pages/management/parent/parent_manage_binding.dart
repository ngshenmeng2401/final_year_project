import 'package:final_year_project/pages/management/parent/parent_management_controller.dart';
import 'package:get/get.dart';

class ParentManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParentManagementController>(
      () => ParentManagementController(),
    );
  }
}