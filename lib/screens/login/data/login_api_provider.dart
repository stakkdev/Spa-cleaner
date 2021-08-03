
import 'package:spa_app/core/networking/base_networking.dart';
import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/utils/shared_pref_util.dart';

import 'login_model.dart';

class LoginApiProvider {
  static const String LOGIN_API = 'auth/login';
  static const String Forgot_API = 'auth/lost-password';

  Future<LoginModel> performLogin(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(LOGIN_API, req, API_TYPE.FORM);
    LoginModel response = LoginModel();
    response.readJson(responseString);
     await SharedPrefSingleton().putAccessToken(response.accessToken);
    return response;
  }

  Future<String> forgotPassword(String req) async {
    Map<String, dynamic> responseString = await performNetworkOperation(Forgot_API, req, API_TYPE.FORM);
    BaseResponse response = BaseResponse.fromJson(responseString);
    return response.errorDescription;
  }
}

