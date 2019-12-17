import 'package:flutter/material.dart';

class AutoLogin extends StatelessWidget {

  final Future future;
  final Widget onWaiting;
  final Widget onSuccess;
  final Widget onError;

  AutoLogin({
    @required this.future,
    @required this.onWaiting,
    @required this.onSuccess,
    @required this.onError
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (_, snapshot){
        switch(snapshot.connectionState) {
          case ConnectionState.waiting:
            return onWaiting;
          case ConnectionState.active:
          case ConnectionState.done:
            return onSuccess;
          default:
            return onError;
        }
      },
    );
  }
}
