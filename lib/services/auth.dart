

import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:forsat/models/user.dart';
import 'package:forsat/services/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends ChangeNotifier {
  bool _isLoggedIn = false;
  late User _user;
  late String? _token;
  bool get authenticated => _isLoggedIn;
  User get user => _user;
  final storage = const FlutterSecureStorage();
  
  void login(Map creds) async {
    print(creds);
    try {
      Dio.Response response = await dio().post('/sanctum/token', data: creds);
      print(response.data.toString());

      String? token = response.data.toString();
      tryToken(token: token);
      _isLoggedIn = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void tryToken({String? token}) async {
    if (token == null) {
      return;
    } else {
      try {
        Dio.Response response = await dio().get('/user',
            options: Dio.Options(headers: {'Authorization': 'Bearer $token'}));
        _isLoggedIn = true;
        _user = User.fromJson(response.data);
        _token = token;
        storeToken(token: token);
        notifyListeners();
        print(_user);
      } catch (e) {
        print(e);
      }
    }
  }

  void storeToken({String? token}) async {
    storage.write(key: 'token', value: token);
  }

  void logout() async {
    try {
      Dio.Response response = await dio().get('/user/revoke',
          options: Dio.Options(headers: {'Authorization': 'Bearer $_token'}));

      cleanUp();
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void cleanUp() async {
    _user;
    _isLoggedIn = false;
    _token = null;
    await storage.delete(key: 'token');
  }
}
