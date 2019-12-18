import 'package:flutter/material.dart';
import 'package:petits_app/app/model/animal.dart';
import 'package:petits_app/app/services/animal_service.dart';
import 'package:petits_app/core/constants.dart';

class AnimalProvider with ChangeNotifier {
  List<Animal> _animals = [];
  int _limit = CONSTANTS.DEFAULT_LIMIT;
  int _page = 1;
  int _lastLimit = 0;

  int get limit => _limit;

  set limit(int limit) {
    if (_limit == 100){
      _page++;
      _limit = 20;
      _lastLimit = 0;
    }
    else {
      _lastLimit = _limit;
      _limit += limit;
    }

    notifyListeners();
  }

  set page(int page){
    _page = page;
    notifyListeners();
  }

  get animals => _animals;

  get animalsCount => _animals.length;

  Future<void> fetchAnimals() async {
    _animals = await AnimalService().getAnimals();

    notifyListeners();
  }

  Future<void> fetchLastAnimals() async {
    List<Animal> _lastAnimals = await AnimalService().getAnimals(limit: limit, page: _page);

    if (_limit != CONSTANTS.DEFAULT_LIMIT) {
      _lastAnimals.removeRange(0, _lastLimit);
    }

    _animals = [..._animals, ..._lastAnimals];

    print("a ${_animals.length}");

    notifyListeners();
  }

  Animal getByID(int id) {
    return _animals.firstWhere((a) => a.id == id);
  }



}