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

  static const ChildrenDetailsPage = '/childrendetailspage';

  static const RecordListPage = '/recordlistpage';
  static const AddRecordDetailsPage = '/addrecordpage';
  static const ListeningQuestionsPage = '/listeningquestionspage';
  static const ReadingQuestionsPage = '/readingquestionspage';
  static const SpeakingQuestionsPage = '/speakingquestionspage';
  static const WritingQuestionsPage = '/writingquestionspage';
  static const EditRecordDetailsPage = '/editrecordpage';

  static const ListeningResultPage = '/listeningresultpage';
  static const ReadingResultPage = '/readingresultpage';
  static const SpeakingResultPage = '/speakingresultpage';
  static const WritingResultPage = '/writingresultpage';

  //History Page
  static const HistoryPage = '/historypage';
  static const AddHistoryPage = '/addhistorypage';
  static const EditHistoryPage = '/edithistorypage';

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