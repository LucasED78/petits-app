import 'package:flutter/material.dart';
import 'package:petits_app/app/model/favorites.dart';
import 'package:petits_app/app/services/favorites_service.dart';

class FavoritesProvider with ChangeNotifier {
  List<Favorites> _favorites = [];

  List<Favorites> get favorites => _favorites;

  void toggleFavorite(int animalId) async{
    has(animalId) ? _favorites.removeWhere((f) => f.animalId == animalId) : _favorites.add(Favorites(
      animalId: animalId
    ));

    notifyListeners();

    try {
      await FavoriteService().toogleFavorite(
          _favorites.map<int>((f) => f.animalId).toList()
      );
    }catch(e){
      if (_favorites.length == 1){
        _favorites = [];
      }
      else {
        has(animalId) ? _favorites.removeWhere((f) => f.animalId == animalId) : _favorites.add(Favorites(
            animalId: animalId
        ));
      }
      notifyListeners();
    }
  }

  bool has(int animalId) => _favorites.indexWhere((e) => e.animalId == animalId) != -1;
}