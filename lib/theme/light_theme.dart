import 'package:flutter/material.dart';


class CustomLightTheme{

  static ThemeData get lighttheme{

    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      shadowColor: Colors.grey[400],
      focusColor: Colors.blue[200],
      fontFamily: 'Arial',
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.blueGrey[300], 
        cursorColor: Colors.blueGrey[300],
        selectionColor: Colors.blue[200],
      ),
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.red[200],
        focusColor: Colors.blue[200],
        labelStyle: TextStyle(color: Colors.red[300]),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[200]!)
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32.0),
        headline6: TextStyle(fontSize: 18.0),
        bodyText2: TextStyle(fontSize: 14.0),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        
        backgroundColor: Colors.grey[350],
        selectedItemColor: Colors.blue[200],
        unselectedItemColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      cardColor: Colors.grey[200],
    );
  }
}