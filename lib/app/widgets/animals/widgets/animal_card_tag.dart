import 'package:flutter/material.dart';

class AnimalCardTag extends StatelessWidget {

  final String content;

  const AnimalCardTag(this.content);

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.deepPurpleAccent,
      label: Text(
        content,
        style: TextStyle(
          color: Theme.of(context).accentColor
        ),
      ),
    );
  }
}
