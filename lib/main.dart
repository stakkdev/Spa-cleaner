// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spa_app/route/page_route.dart';
import 'package:spa_app/screens/jobs/bloc/job_bloc.dart';
import 'package:spa_app/screens/login/bloc/login_bloc.dart';
import 'package:spa_app/screens/notification/bloc/notification_bloc.dart';
import 'package:spa_app/screens/splash_screen.dart';
import 'package:spa_app/screens/timesheet/bloc/time_sheet_bloc.dart';
import 'package:spa_app/utils/custom_color.dart';

import 'core/base_ui/my_router.dart';
import 'core/base_ui/route_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider.value(value: LoginBloc()),
        Provider.value(value: JobBloc()),
        Provider.value(value: NotificationBloc()),
        Provider.value(value: TimeSheetBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme:ColorScheme.light(
            primary: MyColors.DarkBlueBg,
            secondary: MyColors.LightBlueBg,
          ),
        ),

        onGenerateRoute: MyRouter.generateRoute,
        initialRoute: SPLASH_SCREEN,
      ),
    );
  }
}
