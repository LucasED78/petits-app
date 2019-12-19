import 'package:flutter/material.dart';
import 'package:petits_app/presentation/petits_icons_icons.dart';

class EmptyResult extends StatelessWidget {

  final String message;

  const EmptyResult(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(PetitsIcons.sad, color: Colors.black,),
          Text(message)
        ],
      ),
    );
  }
}
