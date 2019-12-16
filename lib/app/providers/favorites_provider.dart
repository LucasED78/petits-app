import 'package:dio/dio.dart';
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
      Response response = await FavoriteService().toggleFavorite(
          _favorites.map<int>((f) => f.animalId).toList()
      );

      print(response.statusCode);
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

  Future<void> fetchFavorites() async{
    Response response = await FavoriteService().fetchFavorites();
    response.data != null ?
        _favorites = response.data.map<Favorites>((f) => Favorites(animalId: f)).toList()
        : _favorites = [];

    notifyListeners();
  }

  }