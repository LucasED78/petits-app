import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petits_app/app/widgets/auth/login_body_item.dart';
import 'package:petits_app/app/widgets/auth/login_top_item.dart';
import 'package:petits_app/core/login_scaffold.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return LoginScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            LoginTopItem(),
            LoginBodyItem(),
          ],
        ),
      ),
    );
  }
}
