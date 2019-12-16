import 'package:dio/dio.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/core/http/firebase_http.dart';
import 'package:petits_app/core/http/http_api.dart';

class FavoriteService {
 Future<Response> toggleFavorite(List<int> animalId) async{
   return await FirebaseHttp().call("/usr${User().id}/favorites", HttpMethod.PUT, data: animalId);
 }

 Future<Response> fetchFavorites() async{
   return await FirebaseHttp().get(path: "/usr${User().id}/favorites");
 }
}