import 'package:flutter/material.dart';
import 'package:petits_app/app/model/address.dart';
import 'package:petits_app/app/model/breed.dart';

class Animal {
  int id;
  String url;
  String type;
  String specie;
  Breed breed;
  //color
  String age;
  String gender;
  String size;
  String name;
  String description;
  List<dynamic> photos;
  String status;
  List<dynamic> tags;
  Address address;

  Animal({
    @required this.id,
    @required this.url,
    @required this.type,
    @required this.specie,
    @required this.breed,
    @required this.age,
    @required this.gender,
    @required this.size,
    @required this.name,
    @required this.description,
    @required this.photos,
    @required this.status,
    @required this.tags,
    @required this.address
  });
  
  factory Animal.fromJSON(dynamic data){
    return Animal(
      id: data['id'],
      url: data['url'],
      type: data['type'],
      specie: data['specie'],
      breed: Breed.fromJSON(data['breeds']),
      age: data['age'],
      gender: data['gender'],
      size: data['size'],
      name: data['name'],
      description: data['description'],
      photos: data['photos'],
      status: data['status'],
      tags: data['tags'],
      address: Address.fromJSON(data['contact']['address'])
    );
  }
}