
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa_app/core/base_ui/my_router.dart';
import 'package:spa_app/core/base_ui/route_constants.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/Strings.dart';
import 'package:spa_app/utils/bottom_sheet.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/dimensions.dart';
import 'package:spa_app/utils/my_color.dart';
import 'package:spa_app/utils/my_string.dart';
import 'package:spa_app/utils/shared_pref_util.dart';


class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: customAppBar(
          title: "Settings",
          showBackBtn: false,
          onTab: ()=>{
            Navigator.of(context).pop(),
          }
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: SizeConfig.safeBlockHorizontal * 3.0,
          ),
          child: ListTile(
            onTap: (){
              displayCustomBottomSheet(context: context, description: "Are you sure you want to logout?",negativeButtonText: "Cancel", positiveButtonText: "Yes" ,callbackPositive: (){
                Navigator.of(context).pop();
                SharedPrefSingleton().clearSharedPreferenceLogout();
                pushNamedAndClearStack(context, LOGIN_SCREEN);
              });
            },
            title: customTextMedium(text: "Logout", fontSize: 5, textColor: TITLE_COLOR),
          ),
        ),
      ),
    );
  }

  Widget _singleRow() {
    return Container(
      padding:
      EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 3.0),
      child: Row(
        children: [
          /*Container(
            child: assetImage(
              image: 'assets/ic_payments.png',
              height: SizeConfig.safeBlockHorizontal * 12.0,
              width: SizeConfig.safeBlockHorizontal * 12.0,
            ),
          ),*/
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 5.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextMedium(
                    text: 'Your job has been completed', fontSize: 4.0, textColor: black20),
                SizedBox(height: SizeConfig.safeBlockHorizontal * 0.5,),
                customTextRegular(
                    text: '15 min ago',
                    fontSize: 3.5,
                    textColor: black97),
              ],
            ),
          ),
        ],
      ),
    );
  }
}