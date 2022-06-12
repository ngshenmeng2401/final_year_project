import 'package:final_year_project/pages/profile/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {

  final settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Card(
              margin: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text("Notifications",style:TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text("Language",style:TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
    
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.format_paint),
                    title: Text("Theme",style:TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){
                      settingsController.navigateThemePage();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text("About_Us",style:TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text("Help_Support",style:TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: (){},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}