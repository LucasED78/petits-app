import 'package:dio/dio.dart';
import 'package:petits_app/core/constants.dart';
import 'package:petits_app/core/http/http_api.dart';
import 'package:petits_app/core/security/SecurityStorage.dart';

class AuthService extends HttpApi {
  login (Map<String, String> userdata) async{
    print(userdata);
    String key = await SecurityStorage().readKey("FIREBASE_KEY");

    Response response = await this.call("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$key", HttpMethod.POST, data: {
      ...userdata, "returnSecureToken": true
    }).catchError((e) => print(e.response.data));

    return response.data;
  }
}