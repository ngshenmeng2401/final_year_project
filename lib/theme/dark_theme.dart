import 'package:flutter/material.dart';

class CustomDarkTheme{
  static ThemeData get darktheme{

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      shadowColor: Colors.grey[600],
      focusColor: Colors.blue[100],
      fontFamily: 'Arial',
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.blueGrey[400], 
        cursorColor: Colors.blueGrey[300],
        selectionColor: Colors.blue[200] 
      ),
      inputDecorationTheme: InputDecorationTheme(
        // fillColor: Colors.red[200],
        focusColor: Colors.blue[200],
        labelStyle: TextStyle(color: Colors.white60),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue[200]!)
        ),
      ),
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 32.0, color: Colors.white),
        headline6: TextStyle(fontSize: 18.0, color: Colors.white),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.blue[200],
        unselectedItemColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      ),
      cardColor: Colors.grey[900],
      dividerTheme: DividerThemeData(
        color: Colors.white
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[400],
      ),
      dataTableTheme: DataTableThemeData(
        dataTextStyle: TextStyle(
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white
          )
        )
      ),
      iconTheme:  IconThemeData(
        color: Colors.white
      ),
    );
  }
}