import 'package:dio/dio.dart';
import 'package:petits_app/core/http/petits_http.dart';
import 'package:petits_app/app/model/animal.dart';

class AnimalService {
  PetitsHttp _http = PetitsHttp();

  Future<List<Animal>> getAnimals({int limit = 20, int page = 1, String name = ''}) async{
    print(name);
    await _http.init();

    String path = "/animals?limit=$limit&page=$page";

    if (name.isNotEmpty) path+= "&name=$name";

    Response response = await _http.get(path: path);

    List<Animal> _animals = response.data['animals'].map<Animal>((a) => Animal.fromJSON(a)).toList();

    return _animals;
  }
}