import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {

  final String text;
  final Icon icon;
  final bool hasNavigation;
  final VoidCallback press;
  final bool isDarkMode;

  const ProfileMenu({
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.press,
    required this.isDarkMode, 
    this.hasNavigation=true, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        width: screenWidth/1.2,
        height: screenHeight/14,
        child: ListTile(
          onTap: press,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 0, 0),
            child: icon,
          ),
          title:Text(text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              // color: isDarkMode == true ?Colors.white : Colors.black,
            ),),
          trailing: hasNavigation == true 
          ? Icon(Icons.keyboard_arrow_right,
              // color: isDarkMode == true ? Colors.white : Colors.black,
              )
          : null,
        ),
      ),
    );
  }
}