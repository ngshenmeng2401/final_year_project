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
        labelStyle: TextStyle(),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[200]!)
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32.0, color: Colors.black),
        headline6: TextStyle(fontSize: 18.0, color: Colors.black),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[350],
        selectedItemColor: Colors.blue[600],
        unselectedItemColor: Colors.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue,
      ),
      cardColor: Colors.grey[200],
      dividerTheme: DividerThemeData(
        color: Colors.blue,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
      ),
      dataTableTheme: DataTableThemeData(
        dataTextStyle: TextStyle(
          color: Colors.black,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black
          )
        )
      ),
      iconTheme:  IconThemeData(
        color: Colors.black
      ),
    );
  }
}