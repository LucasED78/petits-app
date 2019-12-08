import 'package:dio/dio.dart';
import 'package:petits_app/core/http/petits_http.dart';
import 'package:petits_app/app/model/animal.dart';

class AnimalService {
  PetitsHttp _http = PetitsHttp();

  Future<List<Animal>> getAnimals() async{
  await _http.init();
   Response response = await _http.get(path: "/animals");

   List<Animal> _animals = response.data['animals'].map<Animal>((a) => Animal.fromJSON(a)).toList();

   return _animals;
  }
}