part of 'app_pages.dart';

abstract class AppRoutes{

  static const Splash = '/splash';
  static const Login = '/login';
  static const Signup = '/signup';
  static const NotFound = '/notfound';

  //Bottom Navigation Bar
  static const ParentBottomNavigation = '/parentbottomnavigation';
  static const StaffBottomNavigation = '/staffbottomnavigation';
  static const TeacherBottomNavigation = '/teacherbottomnavigation';

  //Home Page
  static const ParentHomePage = '/parenthomepage';
  static const StaffHomePage = '/staffhomepage';
  static const TeacherHomePage = '/teacherhomepage';

  static const RecordListPage = '/recordlistpage';

  //Management Page
  static const ParentManagementPage = '/parentmanagementpage';
  static const TeacherManagementPage = '/teachermanagementpage';
  static const AddStudentDetailsPage = '/addstudentdetailspage';
  static const EditStudentDetailsPage = '/editstudentdetailspage';

  //Profile Page
  static const AccountPage = '/accountpage';

  //Settings Page
  static const SettingsPage = '/settingspage';
  static const LanguagesPage = '/languagespage';
  static const ThemePage = '/themepage';

  static const Test = '/test';
}