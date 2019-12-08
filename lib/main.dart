import 'package:flutter/material.dart';
import 'package:petits_app/core/petits_scaffold.dart';
import 'package:petits_app/core/petits_theme.dart';
import 'package:petits_app/core/security/keys.dart';
import 'package:petits_app/model/animal.dart';
import 'package:petits_app/services/animal_service.dart';

void main() {
  final Keys _keys = Keys();
  _keys.init();

  runApp(PetitsApp());
}

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
