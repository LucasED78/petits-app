import 'package:dio/dio.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/core/constants.dart';
import 'package:petits_app/core/http/http_api.dart';

class FirebaseHttp extends HttpApi {
  String _endpoint = CONSTANTS.FIREBASE_URL;
  User _user = User();

  @override
  call(String path, HttpMethod method, {dynamic data, Options options}) async{
    final String _finalPath = "$_endpoint$path.json?auth=${_user.token}";
    return await getMethod(_finalPath, method, data, options);
  }
}