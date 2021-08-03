import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<Page> /*with WidgetsBindingObserver*/ {
  String screenName();
/*  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (Constants.shouldShowPinScreen) {
        Constants.shouldShowPinScreen = false;
        pushNamed(context, PIN_CONFIRMATION_SCREEN);
      }
    } else {
      Constants.shouldShowPinScreen = true;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }*/
}
