

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spa_app/core/base_ui/route_constants.dart';
import 'package:spa_app/route/page_route.dart';
import 'package:spa_app/screens/dashboard_screen.dart';
import 'package:spa_app/screens/jobs/ui/job_detail_screen.dart';
import 'package:spa_app/screens/jobs/ui/job_list_screen.dart';
import 'package:spa_app/screens/login/ui/forgot_screen.dart';
import 'package:spa_app/screens/login/ui/login_screen.dart';
import 'package:spa_app/screens/setting/setting_screen.dart';
import 'package:spa_app/screens/splash_screen.dart';


class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //////// Login Flow Screens ////////
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case LOGIN_SCREEN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case FORGOT_PASSWORD_SCREEN:
        return MaterialPageRoute(builder: (_) => ForgotScreen());
      case JOB_DETAIL_SCREEN:
        var pId = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => JobDetailScreen(pId));
      case DASHBOARD_SCREEN:
        return MaterialPageRoute(builder: (_) => DashboardScreen());
      case JOB_LIST_SCREEN:
        return MaterialPageRoute(builder: (_) => JobListScreen());
      case SETTING_SCREEN:
        return MaterialPageRoute(builder: (_) => SettingScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(child: Text('This screen is under development. ${settings.name}')),
                ));
    }
  }
}

pushNamed(BuildContext context, String routeName, {var args}) {
  Navigator.pushNamed(context, routeName, arguments: args);
}

pushNamedAndClearStack(BuildContext context, String routeName, {var args}) {
  Navigator.of(context).pushNamedAndRemoveUntil(routeName, (route) => false, arguments: args);
}


pushNamedAndClearStackWithoutAnim(BuildContext context, String routeName, {var args}) {
  Navigator.of(context).pushReplacement(
    CustomPageRoute(
      builder: (BuildContext context) {
        return routeName == LOGIN_SCREEN ? LoginScreen() : DashboardScreen();
      },
    ),
  );
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}