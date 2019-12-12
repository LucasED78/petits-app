import 'package:flutter/material.dart';

class User {
  String id;
  String email;
  String password;

  User({
    this.email,
    this.password
  });

 Map<String, String> toJSON() {
   return {
     "email": email,
     "password": password
   };
 }
}