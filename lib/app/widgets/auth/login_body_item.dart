import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/providers/auth_provider.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/core/exceptions/FirebaseException.dart';
import 'package:petits_app/core/widgets/error_dialog.dart';
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
  bool _visibility = false;

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
              obscureText: !_visibility,
              decoration: InputDecoration(
                labelText: "password",
                suffixIcon: IconButton(
                  icon: IconButton(
                    icon: Icon(_visibility ? Icons.visibility : Icons.visibility_off),
                    onPressed: _changeVisibility,
                  ),
                  onPressed: (){},
                )
              ),
              textInputAction: TextInputAction.done,
              onSaved: (v) => _user.password = v,
            ),
            const SizedBox(height: 20,),
            LoadingButton(
              height: 60,
              width: deviceSize.width * 0.7,
              child: Text("LOGIN", style: Theme.of(context).textTheme.button),
              onPressed: _submit,
            )
          ],
        ),
      ),
    );
  }

  void _submit() async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Provider.of<LoadingProvider>(context).loading = true;
      try{
        await Provider.of<AuthProvider>(context).login(_user);
      }on FirebaseException catch(e){
        showDialog(
          context: context,
          builder: (_) => ErrorDialog(
            content: e.toString(),
            onConfirm: () => Navigator.of(context).pop(),
            onTryAgain: (){
              Navigator.of(context).pop();
              _submit();
            }
          )
        );
      }

      Provider.of<LoadingProvider>(context).loading = false;
    }
  }

  void _changeVisibility() {
    setState(() {
      _visibility = !_visibility;
    });
  }
}
