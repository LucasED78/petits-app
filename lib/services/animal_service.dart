import 'package:dio/dio.dart';
import 'package:petits_app/core/constants.dart';

class AnimalService {
 Future<Map<String, dynamic>> getAnimals() async {
   Response response = await Dio().get("${CONSTANTS.URL}/animals");

   return response.data;
 }
}