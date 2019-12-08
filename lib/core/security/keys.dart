import 'package:flutter/cupertino.dart';
import 'package:petits_app/core/constants.dart';
import 'package:petits_app/core/security/SecurityStorage.dart';

class Keys {
  Map<String, String> _keys = {
    "PETFINDER_KEY": CONSTANTS.PETFINDER_KEY,
    "PETFINDER_SECRET": CONSTANTS.PETFINDER_SECRET
  };

  init(){
    SecurityStorage().setInitialConfig(_keys);
  }
}