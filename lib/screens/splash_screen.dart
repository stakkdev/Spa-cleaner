
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa_app/core/base_ui/my_router.dart';
import 'package:spa_app/core/base_ui/route_constants.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/dimensions.dart';
import 'package:spa_app/utils/my_color.dart';
import 'package:spa_app/utils/my_string.dart';
import 'package:spa_app/utils/shared_pref_util.dart';

import 'dashboard_screen.dart';
import 'login/ui/login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    checkLogin();
  }
  checkLogin() async {
    String token = await SharedPrefSingleton().getAccessToken();
    if (token!=null){
      Future.delayed(const Duration(milliseconds: 1500), () {
        pushNamedAndClearStackWithoutAnim(context, DASHBOARD_SCREEN);
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1500), () {
        pushNamedAndClearStackWithoutAnim(context, LOGIN_SCREEN);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (SizeConfig.screenWidth == 0.0) SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorResources.white,
      body: Center(
          child:  Image.asset('assets/logo.png', fit: BoxFit.contain, height: 150,),
      ),
    );
  }
  Widget buildold(BuildContext context) {
    if (SizeConfig.screenWidth == 0.0) SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorResources.primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Image.asset(
                'assets/splash_bg.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 100,
                child: _bodyWidget(context),
            ),
            Positioned(
              bottom: 0,
              right: -20,
              child: FlatButton(
                child: Container(
                height: 60,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40))
                ),
                  child: Center(
                    child: Text(
                        'Get Started',
                      style: GoogleFonts.ubuntu(
                        fontSize: Dimensions.defaultText,
                        color: ColorResources.primaryColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
            ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset('assets/logo.png', fit: BoxFit.contain,),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 50, left: 50, right: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MyString.CLEAN_HOME_CLEAN_LIFE,
                  style: GoogleFonts.ubuntu(
                      fontSize: Dimensions.largeText,
                      color: ColorResources.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 30,),
                Text(
                  MyString.BOOK_CLEANERS,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ubuntu(
                      fontSize: Dimensions.largeText,
                      color: ColorResources.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
