
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spa_app/screens/notification/bloc/notification_bloc.dart';
import 'package:spa_app/screens/notification/data/notification_model.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/Strings.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/dimensions.dart';
import 'package:spa_app/utils/my_color.dart';
import 'package:spa_app/utils/my_string.dart';

import '../dashboard_screen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isLoading = true;
  NotificationBloc notificationBloc;
  NotificationModel notificationModel;
  @override
  void initState() {
    super.initState();
    notificationBloc = NotificationBloc();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      if (notificationModel == null) getNotificationList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: customAppBar(
          title: Strings().notifications,
          showBackBtn: false,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 0,
          ),
          child: isLoading ? Center(
            child: CircularProgressIndicator(),
          ):ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
              itemCount: notificationModel.data.length,
              itemBuilder: (BuildContext context, int index) {
                return _singleRow(index);
              }),
        ),
      ),
    );
  }

  Widget _singleRow(int index) {
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
                    text: notificationModel.data[index], fontSize: 4.0, textColor: black20),
                SizedBox(height: SizeConfig.safeBlockHorizontal * 0.5,),
                customTextRegular(
                    text: '',
                    fontSize: 3.5,
                    textColor: black97),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void getNotificationList() async{
    NotificationModel tempModel= await notificationBloc.getNotificationList();
    // Navigator.of(context).pop();
    if (tempModel.data!=null) {
      setState(() {
        notificationModel = tempModel;
        isLoading = false;

      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }
}

