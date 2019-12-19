import 'package:flutter/material.dart';

class UserListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      title: Text("Add to list"),
      actions: <Widget>[
        FlatButton(
          child: Text("Create a new list"),
          onPressed: () => Navigator.of(context).pop(true),
        ),
        FlatButton(
          child: Text("Add to existing list"),
          onPressed: () => Navigator.of(context).pop(false),
        )
      ],
    );
  }
}
