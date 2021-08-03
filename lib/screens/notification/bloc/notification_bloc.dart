import 'dart:convert';

import 'package:spa_app/screens/login/data/login_api_provider.dart';
import 'package:spa_app/screens/login/data/login_model.dart';
import 'package:spa_app/screens/notification/data/notification_api_provider.dart';
import 'package:spa_app/screens/notification/data/notification_model.dart';
class NotificationBloc {
  NotificationApiProvider notificationApiProvider = NotificationApiProvider();
  Future<NotificationModel> getNotificationList() async {
    NotificationModel response = await notificationApiProvider.getNotificationList();
    return response;
  }
}