
import 'package:flutter/cupertino.dart';
import 'package:spa_app/core/networking/base_networking.dart';
import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/screens/notification/data/notification_model.dart';
import 'package:spa_app/screens/timesheet/data/time_sheet_model.dart';
import 'package:spa_app/utils/shared_pref_util.dart';


class TimeSheetApiProvider {
  static const String TIME_SHEET_API = 'auth/done-jobs/';

  Future<TimeSheetModel> getTimeSheetList(String req) async {
    String url = TIME_SHEET_API + req;
    Map<String, dynamic> responseString = await performNetworkOperation(
        url, "", API_TYPE.GET);
    TimeSheetModel response = TimeSheetModel.fromJson(responseString);
    return response;
  }
}

