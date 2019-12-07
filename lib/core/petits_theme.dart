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
        )
      )
    );
  }
}