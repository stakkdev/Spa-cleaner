
import 'package:flutter/cupertino.dart';
import 'package:spa_app/core/networking/base_networking.dart';
import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/screens/notification/data/notification_model.dart';
import 'package:spa_app/utils/shared_pref_util.dart';


class NotificationApiProvider {

  static const String NOTIFICATION_API = 'auth/my-notification';

  Future<NotificationModel> getNotificationList() async {
    Map<String, dynamic> responseString = await performNetworkOperation(
        NOTIFICATION_API, "", API_TYPE.GET);
    NotificationModel response = NotificationModel.fromJson(responseString);
    return response;
  }
}

