import 'dart:io';

import 'package:final_year_project/pages/profile/profile_controller.dart';
import 'package:final_year_project/pages/profile/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends GetView<ProfileController> {

  final profileController = Get.put(ProfileController());
  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    String email = appData.read("keepLogin")??'';
    bool isDarkMode = appData.read("isDarkMode") ?? false;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Profile'.tr,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
                      child: Column(children: <Widget>[
                        Container(
                            height: screenHeight / 5.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: 
                              Obx(() => profileController.imgStatus.value == "noimg"
                                ? Image.asset("assets/images/profile.png",
                                    fit: BoxFit.fitWidth,)
                                : Image.network("https://hubbuddies.com/271059/final_year_project/assets/images/profile/${profileController.phoneNo.value}.png",
                                    fit: BoxFit.fitWidth,)
                              )
                            )),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: Column(children: [
                            Obx(() => Text(
                              profileController.userName.value,
                              style: TextStyle(fontSize: 18),
                            )),
                            SizedBox(height: 5),
                            Text(
                              email,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Obx(() => Text(
                              profileController.phoneNo.value,
                              style: TextStyle(fontSize: 18),
                            )),
                          ]),
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ProfileMenu(
                          isDarkMode: isDarkMode,
                          icon: Icon(Icons.person, color: isDarkMode == true ?Colors.white : Colors.black),
                          text: "Edit Profile".tr,
                          press: () {
                            profileController.navigateEditProfilePage(profileController.userName.value, profileController.phoneNo.value, profileController.imgStatus.value);
                          },
                        ),
                        ProfileMenu(
                          isDarkMode: isDarkMode,
                          icon: Icon(Icons.lock, color: isDarkMode == true ?Colors.white : Colors.black),
                          text: "Change Password".tr,
                          press: () {
                            profileController.navigateChangePasswordPage();
                          },
                        ),
                        ProfileMenu(
                          isDarkMode: isDarkMode,
                          icon: Icon(Icons.child_care, color: isDarkMode == true ?Colors.white : Colors.black),
                          text: "Remove Children Slot".tr,
                          press: () {
                            profileController.navigateRemoveChildrenSlotPage();
                          },
                        ),
                        ProfileMenu(
                          isDarkMode: isDarkMode,
                          icon: Icon(Icons.settings_outlined, color: isDarkMode == true ?Colors.white : Colors.black),
                          text: "Settings".tr,
                          press: () {
                            controller.navigateSettingsPage();
                          },
                        ),
                        ProfileMenu(
                          isDarkMode: isDarkMode,
                          icon: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          text: "Logout".tr,
                          press: () {
                            controller.logoutUser();
                          },
                          hasNavigation: false,
                        ),
                      ]),
                  ),
              ]),
          ))),
    );
  }
}
