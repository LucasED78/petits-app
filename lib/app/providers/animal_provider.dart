import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/services/animal_service.dart';

class AnimalProvider with ChangeNotifier {
  List<Animal> _animals = [];
  int _limit = 20;
  int _lastLimit = 0;

  int get limit => _limit;

  set limit(int limit) {
    _lastLimit = _limit;
    _limit+= limit;
    notifyListeners();
  }

  get animals => _animals;

  get animalsCount => _animals.length;

  Future<void> fetchAnimals() async {
    _animals = await AnimalService().getAnimals(limit);

    notifyListeners();
  }

  Future<void> fetchLastAnimals() async {
    print("$_lastLimit $_limit");
    List<Animal> _lastAnimals = await AnimalService().getAnimals(limit);

    if (_animals.length != _limit) {
      _lastAnimals.removeRange(_lastLimit, _limit);
      _animals = [..._animals, ..._lastAnimals];
    }

    notifyListeners();
  }

  Animal getByID(int id) {
    return _animals.firstWhere((a) => a.id == id);
  }



}