import 'package:flutter/material.dart';

class PetitsScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final List<Widget> actions;
  final FloatingActionButton floatingActionButton;
  final bool drawer;

  PetitsScaffold({
    @required this.title,
    @required this.body,
    this.actions,
    this.floatingActionButton,
    this.drawer = false
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: actions != null ? actions : [],
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 0),
            child: Container(
              color: Theme.of(context).accentColor,
              width: deviceSize.width * 0.94,
              height: deviceSize.height,
              child: body,
            ),
          ),
        ),
        floatingActionButton: floatingActionButton != null ? floatingActionButton : Container(),
      ),
    );
  }
}
