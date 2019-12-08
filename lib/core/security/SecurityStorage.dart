import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorage {
  final FlutterSecureStorage _flutterSecureStorage = FlutterSecureStorage();

  Future<void> writeKey(String key, String value) async{
    return await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<String> readKey(String key) async{
    return await _flutterSecureStorage.read(key: key);
  }

  Future<Map<String, String>> readAll() async{
    return await _flutterSecureStorage.readAll();
  }

  void setInitialConfig(Map<String, String> configKeys) {
    return configKeys.forEach((k, v) async{
      if (await readKey(k) != "") await writeKey(k, v);
    });
  }
}