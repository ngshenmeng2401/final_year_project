import 'package:final_year_project/pages/history/teacher/history_view.dart';
import 'package:final_year_project/pages/home/teacher/teacher_home_page.dart';
import 'package:final_year_project/pages/management/teacher/teacher_management_view.dart';
import 'package:final_year_project/pages/profile/profile_view.dart';
import 'package:final_year_project/pages/statistic/staff/statistic_view.dart';
import 'package:final_year_project/widget/bottom_navigation_bar_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherBottomNavigationBarWidget extends StatelessWidget {
  const TeacherBottomNavigationBarWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (controller){
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                StatisticView(),
                TeacherHomeView(),
                HistoryView(),
                TeacherManagementView(),
                ProfileView(position: "Staff"),
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
                icon: CupertinoIcons.group_solid,
                label: 'Class',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.timer,
                label: 'History',
              ),
              _bottomNavigationBarItem(
                icon: Icons.assignment_ind,
                label: 'Management',
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