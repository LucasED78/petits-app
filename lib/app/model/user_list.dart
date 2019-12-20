import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';

class UserList {
  String id;
  String name;
  User owner;
  List<int> animals;

  UserList({
    this.id,
    @required this.name,
    @required this.owner,
    this.animals
  });

  factory UserList.fromJSON(dynamic data){
    return UserList(
      id: data['id'],
      owner: User.fromJSON(data['owner']),
      name: data['name'],
      animals: json.decode(data['animals']).cast<int>()
    );
  }

  Map<String, dynamic> toJSON(){
    final Map<String, dynamic> _userListMap = {
      'name': name,
      'owner': owner.toJSON(),
      'animals': json.encode(animals)
    };

    if (id != null) _userListMap['id'] = id;

    return _userListMap.cast<String, dynamic>();
  }
}