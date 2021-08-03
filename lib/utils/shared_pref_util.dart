import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spa_app/screens/login/data/login_model.dart';

const String USER_MODEL = "USER_MODEL";
const String SESSION_TOKEN = "SESSION_TOKEN";
const String ACCESS_TOKEN = "ACCESS_TOKEN";
const String REFRESH_TOKEN = "REFRESH_TOKEN";
class SharedPrefSingleton {
  static final SharedPrefSingleton _singleton = SharedPrefSingleton._internal();

  factory SharedPrefSingleton() {
    return _singleton;
  }

  SharedPrefSingleton._internal();


  Future<String> getSessionToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SESSION_TOKEN);
  }


  setSessionToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(SESSION_TOKEN, sessionToken);
  }

  Future<String> getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN);
  }


  putAccessToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(ACCESS_TOKEN, sessionToken);
  }


  Future<UserModel> getUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = prefs.getString(USER_MODEL);
    if (key!=null) {
      UserModel model =  UserModel.fromJson(json.decode(key));
      //  if (model.progress == null || model.progress == 0)
      if (model.id != null) {
        return model;
      }
      return model;
    } else {
      return null;
    }

  }

  setUserModelDetail(UserModel session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(USER_MODEL, json.encode(session.toJson()));
  }
  Future<String> getRefreshAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(REFRESH_TOKEN);
  }


  putRefreshAccessToken(String sessionToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(REFRESH_TOKEN, sessionToken);
  }
  clearSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(SESSION_TOKEN);
    prefs.remove(USER_MODEL);

  }

  clearSharedPreferenceLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
