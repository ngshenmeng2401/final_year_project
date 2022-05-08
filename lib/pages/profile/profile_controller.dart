import 'package:final_year_project/model/user.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/user_remote_services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  var userList = <User>[].obs;
  var statusMsj = "Loading".obs;
  var userName = "User".obs, phoneNo = "".obs;

  @override
  void onInit() {
    loadUser();
    super.onInit();
  }

  void loadUser() async{

    var student = await UserRemoteServices.fetchUserDetails();
    if (student != null) {
      userList.assignAll(student);

      userName.value = userList[0].userName.toString();
      phoneNo.value = userList[0].phoneNo.toString();

      print(userList);
    } else {
      statusMsj("No_data".tr);
    }
  }

  void navigateSettingsPage(){
    Get.toNamed(AppRoutes.SettingsPage);
  }

  void navigateChangePasswordPage(){
    Get.toNamed(AppRoutes.ChangePasswordPage);
  }

  void logoutUser(){

    // appData.write('isLogged', false);
    // appData.remove('keepLogin');
    
    Get.offNamedUntil(AppRoutes.Login, (route) => false);
  }
}