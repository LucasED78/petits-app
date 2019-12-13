import 'package:petits_app/core/http/firebase_http.dart';
import 'package:petits_app/core/http/http_api.dart';

class FavoriteService {
 Future<dynamic> toogleFavorite(List<int> animalId) async{
   return await FirebaseHttp().call("/user/favorites", HttpMethod.POST, data: {
     "animalId": animalId
   });
 }
}