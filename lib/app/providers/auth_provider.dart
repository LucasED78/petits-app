import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petits_app/app/model/user.dart';
import 'package:petits_app/app/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  User _user;
  String _token;
  DateTime _tokenExpirationTime;
  Timer _timer;

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
    DateTime tokenExp = DateTime.now().add(Duration(seconds: int.parse(response['expiresIn'])));

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("authData",
      jsonEncode({
        "token": response['idToken'],
        "tokenExp": tokenExp.toIso8601String(),
        "user": jsonEncode(_user.toJSON())
      })
    );

    setData(token: response['idToken'], tokenExpiration: tokenExp, user: _user);
  }

  void setData({ @required String token, @required DateTime tokenExpiration, @required User user }) {
    _user = user;
    _token = token;
    _tokenExpirationTime = tokenExpiration;

    _autoLogout();
    notifyListeners();
  }

  Future<bool> tryAutoLogin() async{
    final prefs = await SharedPreferences.getInstance();

    if(!prefs.containsKey("authData")) return false;

    final Map<String, dynamic> authData = jsonDecode(prefs.getString("authData"));
    final tokenExp = DateTime.parse(authData['tokenExp']);
    final Map<String, dynamic> userData = json.decode(authData['user']);

    setData(token: authData['token'], tokenExpiration: tokenExp, user: User.fromJSON(userData));

    return isAuthenticated;
  }

  void _autoLogout(){
    if (_timer == null && _token != null) {
      Duration timerMilliseconds = Duration(milliseconds: DateTime.now().difference(_tokenExpirationTime).inMilliseconds.abs());
      _timer = Timer(timerMilliseconds, logout);
    }
  }

  void logout() async{
    _timer.cancel();
    final prefs = await SharedPreferences.getInstance();

    prefs.clear();
    _token = null;
    _user = null;
    notifyListeners();
  }
  
}