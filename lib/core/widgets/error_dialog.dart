import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {

  final String content;
  final Function onTryAgain;
  final Function onConfirm;

  ErrorDialog({
    @required this.content,
    @required this.onConfirm,
    this.onTryAgain
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("An error has ocurred"),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: onConfirm,
        ),
        if (onTryAgain != null) FlatButton(
          child: Text("Try again"),
          onPressed: onTryAgain,
        )
      ],
    );
  }
}
