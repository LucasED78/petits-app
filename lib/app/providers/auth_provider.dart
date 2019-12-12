import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User _user;
  String _token;
  DateTime _tokenExpirationTime;

  get token => _token;
  
  get tokenExpirationTime => _tokenExpirationTime;
  
  bool get isAuthenticated {
    if (token != null && tokenExpirationTime != null && tokenExpirationTime.isAfter(DateTime.now())) {
      return true;
    }

    return null;
  }

  Future<void> login(User user) async{
    var response = await AuthService().login(user.toJSON());
    print(response);
    _user.id = response['localId'];
    
    setData(token: response['token'], tokenExpiration: DateTime.now().add(Duration(seconds: response['expiresIn'])), user: _user);
  }

  void setData({ @required String token, @required DateTime tokenExpiration, @required User user }) {
    _user = user;
    _token = token;
    _tokenExpirationTime = tokenExpiration;

    notifyListeners();
  }
  
}