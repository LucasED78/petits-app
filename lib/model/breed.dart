import 'package:flutter/cupertino.dart';

class Breed {
  String primary;
  String secondary;
  bool mixed;
  bool unknown;

  Breed({
    @required this.primary,
    @required this.secondary,
    @required this.mixed,
    @required this.unknown
  });

  factory Breed.fromJSON(dynamic data){
    return Breed(
      primary: data['primary'],
      secondary: data['secondary'],
      mixed: data['mixed'],
      unknown: data['unknown']
    );
  }
}