import 'package:dio/dio.dart';
import 'package:petits_app/core/http/petits_http.dart';
import 'package:petits_app/app/model/animal.dart';

class AnimalService {
  PetitsHttp _http = PetitsHttp();

  Future<List<Animal>> getAnimals({int limit = 20, int page = 1, String name = ''}) async{
    await _http.init();

    String path = "/animals?limit=$limit&page=$page";

    if (name.isNotEmpty) path+= "&name=$name";

    Response response = await _http.get(path: path);

    List<Animal> _animals = response.data['animals'].map<Animal>((a) => Animal.fromJSON(a)).toList();

    return _animals;
  }

  Future<Animal> getByID(int id) async {
    await _http.init();

    Response response = await _http.get(path: "/animals/$id");

    Animal _animal = Animal.fromJSON(response.data);

    return _animal;
  }
}