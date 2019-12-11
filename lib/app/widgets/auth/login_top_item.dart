import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginTopItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: deviceSize.height * 0.4,
      color: Colors.deepPurpleAccent,
      child: Container(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: SvgPicture.asset(
                "assets/icons/paw.svg",
                color: Theme.of(context).accentColor,
                width: 100,
              ),
            ),
            Text(
              "Petits",
              style: TextStyle(color: Theme.of(context).accentColor, fontSize: 22),
            )
          ],
        ),
      ),
    );
  }
}
