import 'package:flutter/material.dart';
class GradientRaisedButton extends StatefulWidget {
  final Widget child;
  final double width;
  final double height;
  final Gradient color;
  final Function onPressed;

  GradientRaisedButton({
    @required this.onPressed,
    @required this.child,
    this.color,
    this.width = double.infinity,
    this.height = 50
  });
  
  @override
  _GradientRaisedButtonState createState() => _GradientRaisedButtonState();
}

class _GradientRaisedButtonState extends State<GradientRaisedButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          gradient: widget.color ?? LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurpleAccent,
              Theme.of(context).accentColor,
            ]
          )
        ),
        child: InkWell(
          splashColor: Colors.deepPurpleAccent,
          child: Center(child: widget.child),
          onTap: widget.onPressed,
        ),
      ),
    );
  }
}
