import 'package:flutter/material.dart';
import 'package:petits_app/core/widgets/gradient_raised_button.dart';

class LoginBodyItem extends StatefulWidget {
  @override
  _LoginBodyItemState createState() => _LoginBodyItemState();
}

class _LoginBodyItemState extends State<LoginBodyItem> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      width: deviceSize.width * 0.9,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: "email"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _passwordFocusNode.requestFocus(),
            ),
            const SizedBox(height: 10,),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "password"
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 10,),
            GradientRaisedButton(
              width: deviceSize.width * 0.6,
              child: Text("LOGIN", style: Theme.of(context).textTheme.button),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
