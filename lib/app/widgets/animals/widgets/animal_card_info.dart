import 'package:flutter/material.dart';

class AnimalCardInfo extends StatelessWidget {

  final IconData icon;
  final String content;
  final double width;

  AnimalCardInfo({
    @required this.icon,
    @required this.content,
    @required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Column(
        children: <Widget>[
          Icon(icon),
          const SizedBox(height: 5,),
          Text(
            content,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
