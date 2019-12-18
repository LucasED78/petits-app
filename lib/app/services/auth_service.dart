import 'package:dio/dio.dart';
import 'package:petits_app/core/exceptions/FirebaseException.dart';
import 'package:petits_app/core/http/http_api.dart';
import 'package:petits_app/core/security/SecurityStorage.dart';

class AuthService extends HttpApi {
  login (Map<String, String> userdata) async{
    try {
      String key = await SecurityStorage().readKey("FIREBASE_KEY");

      Response response = await this.call("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$key", HttpMethod.POST, data: {
        ...userdata, "returnSecureToken": true
      });

      return response.data;
    }catch(e){
      print(e.response.data);
      Map<String, dynamic> response = e.response.data.cast<String, dynamic>();

      if (response.containsKey("error")) FirebaseErrors.throwError(response['error']['message']);
    }
  }
}