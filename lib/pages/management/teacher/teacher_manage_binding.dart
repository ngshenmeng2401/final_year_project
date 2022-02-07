import 'package:final_year_project/pages/management/teacher/teacher_management_controller.dart';
import 'package:get/get.dart';

class TeacherManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherManagementController>(
      () => TeacherManagementController(),
    );
  }
}