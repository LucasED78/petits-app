import 'package:flutter/cupertino.dart';
import 'package:petits_app/model/animal.dart';

class AnimalProvider with ChangeNotifier {
  List<Animal> _animals = [];
}