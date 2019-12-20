import 'package:flutter/material.dart';

class PetitsTheme {
  static get mainTheme {
    return ThemeData(
      primaryColor: Color.fromRGBO(106, 0, 128, 1),
      backgroundColor: Colors.white,
      accentColor: Color.fromRGBO(208, 92, 227, 1),
      appBarTheme: AppBarTheme(
        color: Colors.deepPurpleAccent
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black
        ),
        button: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w300
        )
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.deepPurple,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurpleAccent)
        ),
        labelStyle: TextStyle(
          color: Colors.deepPurpleAccent,
        ),
      )
    );
  }
}