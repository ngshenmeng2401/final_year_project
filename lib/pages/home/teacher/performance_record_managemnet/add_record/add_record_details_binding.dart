
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_controller.dart';
import 'package:get/get.dart';

class AddRecordDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerformanceRecordController>(
      () => PerformanceRecordController(),
    );
  }
}