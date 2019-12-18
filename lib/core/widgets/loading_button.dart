import 'package:flutter/material.dart';
import 'package:petits_app/app/providers/loading_provider.dart';
import 'package:petits_app/core/widgets/gradient_raised_button.dart';
import 'package:petits_app/core/widgets/loading.dart';
import 'package:provider/provider.dart';

class LoadingButton extends StatelessWidget {

  final Widget child;
  final Function onPressed;
  final double width;
  final double height;

  LoadingButton({
    @required this.child,
    @required this.onPressed,
    this.width = double.infinity,
    this.height = 50
  });

  @override
  Widget build(BuildContext context) {
    return GradientRaisedButton(
      width: width,
      height: height,
      child: Provider.of<LoadingProvider>(context).loading ? Loading() : child,
      onPressed: onPressed,
    );
  }
}
