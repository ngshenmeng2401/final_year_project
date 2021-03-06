import 'package:final_year_project/pages/home/staff/staff_home_view.dart';
import 'package:final_year_project/pages/profile/profile_view.dart';
import 'package:final_year_project/widget/bottom_navigation_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffBottomNavigationBarWidget extends StatelessWidget {
  const StaffBottomNavigationBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (controller){
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                StaffHomeView(),
                // ProfileView("a"),
              ],
            ),
          ),

          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}