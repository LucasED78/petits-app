import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:petits_app/app/providers/animal_provider.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/core/widgets/loading.dart';
import 'package:provider/provider.dart';

class PetitsScaffold extends StatelessWidget {

  final String title;
  final Widget body;
  final List<Widget> actions;
  final FloatingActionButton floatingActionButton;
  final SpeedDial speedDial;
  final bool drawer;

  PetitsScaffold({
    this.title = "",
    @required this.body,
    this.actions,
    this.floatingActionButton,
    this.speedDial,
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
        resizeToAvoidBottomInset: false,
        appBar: Provider.of<AnimalProvider>(context).animalsCount > 0 ? AppBar(
          title: Text(title),
          actions: actions != null ? actions : [],
        ) : PreferredSize(
          preferredSize: Size(0,0),
          child: Container(),
        ),
        backgroundColor: Colors.transparent,
        body: Provider.of<LoadingProvider>(context).loading ? Loading() : Center(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 0),
            child: Container(
              color: Theme.of(context).backgroundColor,
              width: deviceSize.width * 0.94,
              height: deviceSize.height,
              child: body,
            ),
          ),
        ),
        floatingActionButton: fab,
      ),
    );
  }

  get fab {
    if (floatingActionButton != null && speedDial == null) return floatingActionButton;
    else if (speedDial != null && floatingActionButton == null) return speedDial;
    else return Container();
  }
}
