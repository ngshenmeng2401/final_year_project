import 'package:final_year_project/model/user.dart';
import 'package:final_year_project/pages/profile/edit_profile/edit_profile_view.dart';
import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/service/user_remote_services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{

  var userList = <User>[].obs;
  var statusMsj = "Loading".obs;
  var userName = "User".obs, phoneNo = "profile".obs;
  var imgStatus = "no".obs;

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
      imgStatus.value = userList[0].imgStatus.toString();

      print(userList);
    } else {
      statusMsj("No data".tr);
    }
  }

  void navigateSettingsPage(){
    Get.toNamed(AppRoutes.SettingsPage);
  }

  void navigateEditProfilePage(String name, String phoneNo, String imgStatus){
    Get.to(() => EditProfileView(name: name, phoneNo: phoneNo, imgStatus: imgStatus,))!.then((value) => loadUser());
  }

  void navigateChangePasswordPage(){
    Get.toNamed(AppRoutes.ChangePasswordPage);
  }

  void navigateRemoveChildrenSlotPage(){
    Get.toNamed(AppRoutes.RemoveChildrenSlotPage);
  }

  void logoutUser(){

    // appData.write('isLogged', false);
    // appData.remove('keepLogin');
    
    Get.offNamedUntil(AppRoutes.Login, (route) => false);
  }
}