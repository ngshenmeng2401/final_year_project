import 'package:final_year_project/pages/history/teacher/history_controller.dart';
import 'package:final_year_project/pages/history/parent/children_history_controller.dart';
import 'package:final_year_project/pages/home/parent/parent_home_controller.dart';
import 'package:final_year_project/pages/home/teacher/teacher_home_controller.dart';
import 'package:final_year_project/pages/management/parent/parent_management_controller.dart';
import 'package:final_year_project/pages/management/teacher/teacher_management_controller.dart';
import 'package:final_year_project/pages/profile/profile_controller.dart';
import 'package:final_year_project/pages/statistic/staff/statstic_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class BottomNavigationBarController extends GetxController {

  static final appData = GetStorage();
  var tabIndex = 0;

  void changeTabIndex(int index) {

    String position = appData.read("position")??'';
    print(position);

    tabIndex = index;
    update();
    if(position == "Parent"){

      if(tabIndex == 0){

        Get.delete<ChildrenHistoryController>();
        Get.delete<ParentManagementController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 1){

        Get.delete<ParentHomeController>();
        Get.delete<ParentManagementController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 2){

        Get.delete<ParentHomeController>();
        Get.delete<ChildrenHistoryController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 3){

        Get.delete<ParentHomeController>();
        Get.delete<ParentManagementController>();
        Get.delete<ChildrenHistoryController>();

      }

    }else if(position == "Staff"){

      if(tabIndex == 0){

        Get.delete<TeacherHomeController>();
        Get.delete<HistoryController>();
        Get.delete<TeacherManagementController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 1){

        Get.delete<StatisticsController>();
        Get.delete<HistoryController>();
        Get.delete<TeacherManagementController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 2){

        Get.delete<StatisticsController>();
        Get.delete<TeacherHomeController>();
        Get.delete<TeacherManagementController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 3){

        Get.delete<StatisticsController>();
        Get.delete<TeacherHomeController>();
        Get.delete<HistoryController>();
        Get.delete<ProfileController>();

      }else if(tabIndex == 4){

        Get.delete<StatisticsController>();
        Get.delete<TeacherHomeController>();
        Get.delete<HistoryController>();
        Get.delete<TeacherManagementController>();

      }
    }
  }
}