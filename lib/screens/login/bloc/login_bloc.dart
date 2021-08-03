import 'dart:convert';

import 'package:spa_app/screens/login/data/login_api_provider.dart';
import 'package:spa_app/screens/login/data/login_model.dart';
class LoginBloc {
  LoginApiProvider loginApiProvider = LoginApiProvider();
  Future<LoginModel> performLogin(String username, String password) async {
    String req = "{\"username\":\"$username\",\"password\":\"$password\",\"device_id\":\"12345\"}";
    String reqBody = "username=$username&password=${base64.encode(utf8.encode(password))}&device_id=123344";
    LoginModel response = await loginApiProvider.performLogin(req);
    return response;
  }

  Future<String> forgotPassword(String username) async {
    String req = "{\"email\":\"$username\"}";
   String responseString = await loginApiProvider.forgotPassword(req);
    return responseString;
  }
}