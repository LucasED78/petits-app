
import 'package:dio/dio.dart';
import 'package:petits_app/core/constants.dart';
import 'package:petits_app/core/http/http_api.dart';
import 'package:petits_app/core/security/SecurityStorage.dart';
import 'package:flutter/material.dart';

class PetitsHttp extends HttpApi {
  String _authorization;
  String _endpoint;
  Options _options = Options();
  static PetitsHttp _httpInstance;

  PetitsHttp._();

  factory PetitsHttp() {
    if (_httpInstance == null) {
      _httpInstance = PetitsHttp._();
    }

    return _httpInstance;
  }

  @override
  call(String path, HttpMethod method, {dynamic data, Options options}) async{
    _endpoint = "${CONSTANTS.URL}$path";

    return await getMethod(_endpoint, method, data, _options);
 }

 @override
 get({ @required String path, Options options}) async{
    return await call(path, HttpMethod.GET, options: _options);
 }
  
 Future<void> init() async {
    Map<String, String> keys = await SecurityStorage().readAll();

    if (keys.length > 0) {
      if (_authorization == null) {
        Response response = await call("/oauth2/token", HttpMethod.POST, data: {
          "grant_type": "client_credentials",
          "client_id": keys["PETFINDER_KEY"],
          "client_secret": keys["PETFINDER_SECRET"]
        }, options: _options);

        _authorization = response.data['access_token'];

        _options = Options(
          headers: {
            "Authorization": "Bearer $_authorization"
          }
        );
      }
    }
  }
}