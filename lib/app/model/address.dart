import 'package:flutter/cupertino.dart';

class Address {
  String city;
  String state;
  String country;

  Address({
    @required this.city,
    @required this.state,
    @required this.country
  });

  factory Address.fromJSON(dynamic data) {
    print(data.toString());
    return Address(
      city: data['city'],
      state: data['state'],
      country: data['country']
    );
  }
}