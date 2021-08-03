import 'dart:convert';

import 'package:spa_app/screens/login/data/login_api_provider.dart';
import 'package:spa_app/screens/login/data/login_model.dart';
import 'package:spa_app/screens/notification/data/notification_api_provider.dart';
import 'package:spa_app/screens/notification/data/notification_model.dart';
import 'package:spa_app/screens/timesheet/data/time_sheet_api_provider.dart';
import 'package:spa_app/screens/timesheet/data/time_sheet_model.dart';
class TimeSheetBloc {
  TimeSheetApiProvider timeSheetApiProvider = TimeSheetApiProvider();
  Future<TimeSheetModel> getTimeSheet(String startDate, String endDate) async {
    String req = "$startDate"+'/'+ "$endDate";
    TimeSheetModel response = await timeSheetApiProvider.getTimeSheetList(req);
    return response;
  }
}