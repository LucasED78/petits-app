import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/providers/auth_provider.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/core/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class LoginBodyItem extends StatefulWidget {
  @override
  _LoginBodyItemState createState() => _LoginBodyItemState();
}

class _LoginBodyItemState extends State<LoginBodyItem> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _passwordFocusNode = FocusNode();
  User _user = User();

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
            TextFormField(
              decoration: InputDecoration(
                  labelText: "email"
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
              onSaved: (v) => _user.email = v,
            ),
            const SizedBox(height: 10,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "password"
              ),
              textInputAction: TextInputAction.done,
              onSaved: (v) => _user.password = v,
            ),
            const SizedBox(height: 10,),
            LoadingButton(
              width: deviceSize.width * 0.6,
              child: Text("LOGIN", style: Theme.of(context).textTheme.button),
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }

  void submit() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Provider.of<LoadingProvider>(context).loading = true;
      await Provider.of<AuthProvider>(context).login(_user);
      Provider.of<LoadingProvider>(context).loading = false;
    }
  }
}
