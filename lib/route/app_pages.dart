import 'package:final_year_project/pages/login/login_binding.dart';
import 'package:final_year_project/pages/login/login_view.dart';
import 'package:final_year_project/pages/not_found_screen.dart';
import 'package:final_year_project/pages/profile/profile_view.dart';
import 'package:final_year_project/pages/signup/signup_binding.dart';
import 'package:final_year_project/pages/signup/signup_view.dart';
import 'package:final_year_project/pages/splash/splash_binding.dart';
import 'package:final_year_project/pages/splash/splash_view.dart';
import 'package:final_year_project/widget/bottom_navigation_binding.dart';
import 'package:final_year_project/widget/parent_bottom_navigation_bar.dart';
import 'package:final_year_project/widget/staff_bottom_navigation_bar.dart';
import 'package:final_year_project/widget/teacher_bottom_navigation_bar.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages{

  static final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.Login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    GetPage(
      name: AppRoutes.Signup,
      page: () => SignUpView(),
      binding:SignUpBinding(),
    ),

    GetPage(
      name: AppRoutes.ParentBottomNavigation,
      page: () => ParentBottomNavigationBarWidget(),
      binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.StaffBottomNavigation,
      page: () => StaffBottomNavigationBarWidget(),
      binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.TeacherBottomNavigation,
      page: () => TeacherBottomNavigationBarWidget(),
      binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.AccountPage,
      page: () => ProfileView(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundScreen(),
  );
}