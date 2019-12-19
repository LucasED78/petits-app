import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {

  final Function validator;
  final Function onSaved;
  final Function onSubmitted;
  final Function onChanged;

  RoundedTextField({
    @required this.validator,
    this.onSaved,
    this.onSubmitted,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).accentColor,
        border: border,
        enabledBorder: border
      ),
      validator: validator,
      onSaved: onSaved,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
    );
  }

  OutlineInputBorder get border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: BorderSide(color: Colors.transparent)
  );
}
