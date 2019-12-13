import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  User _user;
  String _token;
  DateTime _tokenExpirationTime;

  get token {
    if (_token != null && tokenExpirationTime != null && tokenExpirationTime.isAfter(DateTime.now())) {
      return _token;
    }

    return null;
  }

  get tokenExpirationTime => _tokenExpirationTime;

  set user(User user) {
    _user = user;
    notifyListeners();
  }

  User get user => _user;
  
  bool get isAuthenticated => token != null;

  Future<void> login(User user) async{
    var response = await AuthService().login(user.toJSON());
    user.id = response['localId'];
    user.token = response['idToken'];
    _user = user;
    
    setData(token: response['idToken'], tokenExpiration: DateTime.now().add(Duration(seconds: int.parse(response['expiresIn']))), user: _user);
  }

  void setData({ @required String token, @required DateTime tokenExpiration, @required User user }) {
    _user = user;
    _token = token;
    _tokenExpirationTime = tokenExpiration;

    notifyListeners();
  }
  
}