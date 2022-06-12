import 'package:final_year_project/pages/profile/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeView extends GetView<SettingsController> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Change Theme"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  GetBuilder<SettingsController>(
                    init: SettingsController(),
                    builder: (controller) {
                      return ListTile(
                        title:
                            Text("Dark_Theme", style: TextStyle(fontSize: 18)),
                        subtitle: Text("Dark_Theme_Desciption",
                            style: TextStyle(fontSize: 14)),
                        trailing: Radio(
                          activeColor: Colors.blue[400],
                          value: true,
                          groupValue: controller.isDarkMode,
                          onChanged: (value) {
                            controller.chooseLightTheme(value);
                          },
                        ),
                      );
                    },
                  ),
                  GetBuilder<SettingsController>(
                    init: SettingsController(),
                    builder: (controller) {
                      return ListTile(
                        title: Text("Light_Theme", style: TextStyle(fontSize: 18)),
                        subtitle: Text("Light_Theme_Desciption",
                            style: TextStyle(fontSize: 14)),
                        trailing: Radio(
                          activeColor: Colors.blue[400],
                          value: false,
                          groupValue: controller.isDarkMode,
                          onChanged: (value) {
                            controller.chooseLightTheme(value);
                          },
                        ),
                      );
                    },
                  ),
                  // GetBuilder<SettingsController>(
                  //   init: SettingsController(),
                  //   builder: (controller) {
                  //     return ListTile(
                  //       title: Text("System Default",
                  //           style: TextStyle(fontSize: 18)),
                  //       subtitle: Text(
                  //           "The primary color will base on system theme",
                  //           style: TextStyle(fontSize: 14)),
                  //       trailing: Radio(
                  //         activeColor: Colors.red[200],
                  //         value: null,
                  //         groupValue: false,
                  //         onChanged: (value) {
                  //           // controller.onClickRadioButton(value);
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}