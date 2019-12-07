import 'package:flutter/material.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:petits_app/core/petits_theme.dart';

void main() => runApp(PetitsApp());

class PetitsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PetitsTheme.mainTheme,
      home: PetitsScaffold(
        title: "Test",
        body: Text("a"),
      ),
    );
  }
}
