import 'package:final_year_project/pages/history/add_test_date/add_history_view.dart';
import 'package:final_year_project/pages/history/history_view.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/children_details_view.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/listening_result.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/reading_result.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/speaking_result.dart';
import 'package:final_year_project/pages/home/parent/children_details.dart/writing_result.dart';
import 'package:final_year_project/pages/home/parent/parent_home_view.dart';
import 'package:final_year_project/pages/home/staff/staff_home_view.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/listening_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/reading_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/speaking_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/add_record/writing_questions.dart';
import 'package:final_year_project/pages/home/teacher/performance_record_managemnet/performance_record_view.dart';
import 'package:final_year_project/pages/home/teacher/teacher_home_page.dart';
import 'package:final_year_project/pages/login/login_binding.dart';
import 'package:final_year_project/pages/login/login_view.dart';
import 'package:final_year_project/pages/management/teacher/add_student/add_student_view.dart';
import 'package:final_year_project/pages/management/teacher/teacher_manage_binding.dart';
import 'package:final_year_project/pages/management/teacher/teacher_management_view.dart';
import 'package:final_year_project/pages/not_found_screen.dart';
import 'package:final_year_project/pages/profile/profile_view.dart';
import 'package:final_year_project/pages/profile/settings/settings_view.dart';
import 'package:final_year_project/pages/profile/settings/theme_binding.dart';
import 'package:final_year_project/pages/profile/settings/theme_view.dart';
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


    //Bottom Navigation Bar
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


    //Home Page
    GetPage(
      name: AppRoutes.ParentHomePage,
      page: () => ParentHomeView(),
      // binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.ChildrenDetailsPage,
      page: () => ChildrenDetailsView(),
      // binding: AddRecordDetailsBinding(),
    ),

    GetPage(
      name: AppRoutes.StaffHomePage,
      page: () => StaffHomeView(),
      // binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.TeacherHomePage,
      page: () => TeacherHomeView(),
      // binding: BottomNavigationBarBinding(),
    ),

    GetPage(
      name: AppRoutes.ListeningQuestionsPage,
      page: () => ListeningQuestions(),
    ),

    GetPage(
      name: AppRoutes.ReadingQuestionsPage,
      page: () => ReadingQuestions(),
    ),

    GetPage(
      name: AppRoutes.SpeakingQuestionsPage,
      page: () => SpeakingQuestions(),
    ),

    GetPage(
      name: AppRoutes.WritingQuestionsPage,
      page: () => WritingQuestions(),
    ),

    GetPage(
      name: AppRoutes.RecordListPage,
      page: () => RecordListView(),
    ),

    GetPage(
      name: AppRoutes.ListeningResultPage,
      page: () => ListeningResult(),
    ),

    GetPage(
      name: AppRoutes.ReadingResultPage,
      page: () => ReadingResult(),
    ),

    GetPage(
      name: AppRoutes.SpeakingResultPage,
      page: () => SpeakingResult(),
    ),

    GetPage(
      name: AppRoutes.WritingResultPage,
      page: () => WritingResult(),
    ),

    GetPage(
      name: AppRoutes.AddHistoryPage,
      page: () => AddHistoryView(),
    ),

    //Management
    GetPage(
      name: AppRoutes.TeacherManagementPage,
      page: () => TeacherManagementView(),
      binding: TeacherManagementBinding(),
    ),

    GetPage(
      name: AppRoutes.AddStudentDetailsPage,
      page: () => AddStudentDetailsView(),
    ),

    // GetPage(
    //   name: AppRoutes.EditStudentDetailsPage,
    //   page: () => EditStudentDetailsView(),
    // ),


    //Profile
    GetPage(
      name: AppRoutes.AccountPage,
      page: () => ProfileView(),
    ),


    //Settings
    GetPage(
      name: AppRoutes.SettingsPage,
      page: () => SettingsView(),
    ),

    GetPage(
      name: AppRoutes.LanguagesPage,
      page: () => SettingsView(),
    ),

    GetPage(
      name: AppRoutes.ThemePage,
      page: () => ThemeView(),
      binding: ThemeBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundScreen(),
  );
}