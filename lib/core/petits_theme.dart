import 'package:flutter/material.dart';

class PetitsTheme {
  static get mainTheme {
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      accentColor: Colors.white,
      appBarTheme: AppBarTheme(
        color: Colors.deepPurpleAccent
      ),
      textTheme: TextTheme(
        title: TextStyle(
          color: Colors.black
        ),
        button: TextStyle(
          color: Colors.black,
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