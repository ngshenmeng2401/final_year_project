import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:group_button/group_button.dart';

class ListeningQuestions extends StatelessWidget {

  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final bool isDarkMode = appData.read("isDarkMode") ?? false;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Listening".tr,style: const TextStyle(fontSize: 22),),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Text("1."),
                SizedBox(width: 10),
                Text("Listen to and identify sounds in the enviroment.".tr,style: const TextStyle(fontSize: 16),),
              ],
            ),
          ),
          SizedBox(height: 10),
          GroupButton(
            groupRunAlignment: GroupRunAlignment.spaceBetween,
            borderRadius: BorderRadius.circular(10),
            textAlign: TextAlign.center,
            groupingType: GroupingType.wrap,
            spacing: screenWidth/16,
            unselectedColor: isDarkMode == false ? Colors.grey[600] : Colors.grey,
            selectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            unselectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            buttons: [
              "1",
              "2",
              "3",
              "4",
              "5",
            ], 
            onSelected: (int index, bool isSelected) {
              print("${index+1}");
              isSelected = true;
            },),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Text("2."),
                SizedBox(width: 10),
                Text("Identify words with same beginning sounds.".tr,style: const TextStyle(fontSize: 16),),
              ],
            ),
          ),
          SizedBox(height: 10),
          GroupButton(
            groupRunAlignment: GroupRunAlignment.spaceBetween,
            borderRadius: BorderRadius.circular(10),
            textAlign: TextAlign.center,
            groupingType: GroupingType.wrap,
            spacing: screenWidth/16,
            unselectedColor: isDarkMode == false ? Colors.grey[600] : Colors.grey,
            selectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            unselectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            buttons: [
              "1",
              "2",
              "3",
              "4",
              "5",
            ], 
            onSelected: (int index, bool isSelected) {
              print("${index+1}");
              isSelected = true;
            },),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Text("3."),
                SizedBox(width: 10),
                Text("Understand and follow simple instructions.".tr,style: const TextStyle(fontSize: 16),),
              ],
            ),
          ),
          SizedBox(height: 10),
          GroupButton(
            groupRunAlignment: GroupRunAlignment.spaceBetween,
            borderRadius: BorderRadius.circular(10),
            textAlign: TextAlign.center,
            groupingType: GroupingType.wrap,
            spacing: screenWidth/16,
            unselectedColor: isDarkMode == false ? Colors.grey[600] : Colors.grey,
            selectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            unselectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            buttons: [
              "1",
              "2",
              "3",
              "4",
              "5",
            ], 
            onSelected: (int index, bool isSelected) {
              print("${index+1}");
              isSelected = true;
            },),
          SizedBox(height: 10),
          Container(
            child: Row(
              children: [
                Text("4."),
                SizedBox(width: 10),
                Text("Understand meaning of simple words.".tr,style: const TextStyle(fontSize: 16),),
              ],
            ),
          ),
          SizedBox(height: 10),
          GroupButton(
            groupRunAlignment: GroupRunAlignment.spaceBetween,
            borderRadius: BorderRadius.circular(10),
            textAlign: TextAlign.center,
            groupingType: GroupingType.wrap,
            spacing: screenWidth/16,
            unselectedColor: isDarkMode == false ? Colors.grey[600] : Colors.grey,
            selectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            unselectedTextStyle: TextStyle(color: isDarkMode == false ? Colors.black : Colors.white,),
            buttons: [
              "1",
              "2",
              "3",
              "4",
              "5",
            ], 
            onSelected: (int index, bool isSelected) {
              print("${index+1}");
              isSelected = true;
            },),
        ],
      ),
    );
  }
}