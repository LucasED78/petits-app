import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

enum HttpMethod { POST, GET, PUT, DELETE, PATCH }

abstract class HttpApi {
  call(String path, HttpMethod method, {dynamic data, Options options}) async{
    return await getMethod(path, method, data, options);
  }

  get({ @required String path, Options options}) async{
    return await _get(path: path, options: options);
  }

  delete({ @required String path, Options options }) async{
    return await _delete(path: path, options: options);
  }

   _post({ @required String path, @required dynamic data, Options options }) async{

    return await Dio().post(path, data: data, options: options);
  }

  _get({ @required String path, Options options }) async{
    return await Dio().get(path, options: options);
  }

  _put({ @required String path, @required dynamic data, Options options }) async{
    return await Dio().put(path, data: data, options: options);
  }

  _patch({ @required String path, @required dynamic data, Options options }) async{
    return await Dio().patch(path, data: data, options:  options);
  }

  _delete({ @required String path, Options options }) async{
    return await Dio().delete(path, options: options);
  }

  Future getMethod(String path, HttpMethod method, dynamic data, Options options) async {
    print(path);
    if (method == HttpMethod.POST) return await _post(path: path, data: data, options: options);
    else if (method == HttpMethod.GET) return await _get(path: path, options: options);
    else if (method == HttpMethod.PUT) return await _put(path: path, data: data, options: options);
    else if (method == HttpMethod.PATCH) return await _patch(path: path, data: data, options: options);
    else if (method == HttpMethod.DELETE) return await _delete(path: path, options: options);
  }
}