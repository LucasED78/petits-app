import 'package:flutter/cupertino.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/services/animal_service.dart';

class AnimalProvider with ChangeNotifier {
  List<Animal> _animals = [];

  get animals => _animals;

  get animalsCount => _animals.length;

  Future<void> fetchAnimals() async {
    _animals = await AnimalService().getAnimals();
    notifyListeners();
  }
}