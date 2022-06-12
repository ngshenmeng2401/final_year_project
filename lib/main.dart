import 'package:final_year_project/route/app_pages.dart';
import 'package:final_year_project/theme/dark_theme.dart';
import 'package:final_year_project/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final appData = GetStorage();
void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final bool isDarkMode = appData.read("isDarkMode") ?? false;

    return GetMaterialApp(
      title: 'Tasneem Children Performance System',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.Splash,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unknownRoute,
      // theme: CustomLightTheme.lighttheme,
      // darkTheme: CustomDarkTheme.darktheme,
      // themeMode: ThemeMode.system,
      // locale: Locale(selectLanguage),
      // fallbackLocale: TranslationService.fallbackLocale,
      // translations: TranslationService(),
    );
  }
}