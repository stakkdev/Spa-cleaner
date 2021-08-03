import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:spa_app/screens/timesheet/bloc/time_sheet_bloc.dart';
import 'package:spa_app/screens/timesheet/data/time_sheet_model.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/Strings.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:spa_app/utils/my_color.dart';

class TimeSheetScreen extends StatefulWidget {
  @override
  _TimeSheetScreenState createState() => _TimeSheetScreenState();
}

class _TimeSheetScreenState extends State<TimeSheetScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLoading = false;
  TimeSheetBloc timeSheetBloc;
  TimeSheetModel timeSheetModel;
  String startDate = "2021-07-01";
  String endDate = "2021-07-27";
  double width = 0;
  @override
  void initState() {
    super.initState();
    timeSheetBloc = TimeSheetBloc();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: customAppBarAction(
          title: "Time Sheet",
          showBackBtn: false,
          onTab: () => {
                Navigator.of(context).pop(),
              }, actionType: IconButton(
        icon: const Icon(Icons.refresh_outlined),
        tooltip: 'Refresh the list',
        onPressed: () {
          getTimeSheetList();}
      )),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 0,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: customTextBorderClick(
                          text: startDate == null ? "Start date" : startDate,
                          fontSize: 4,
                          textColor: MyColors.grayDrakText,
                          onPressed: () {
                            openDatePicker(true);
                          }),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: customTextBorderClick(
                          text: endDate == null ? "End date" : endDate,
                          fontSize: 4,
                          textColor: MyColors.grayDrakText,
                          onPressed: () {
                            openDatePicker(false);
                          }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                          itemCount: timeSheetModel==null || timeSheetModel.data == null
                              ? 0
                              : timeSheetModel.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _singleRow(index);
                          }),
                ),
              ],
            )),
      ),
    );
  }

  Widget _singleRow(int index) {
    var model = timeSheetModel.data[index];
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 3.0),
      child: Row(
        children: [
          /*squareImage(
                image: 'assets/ic_payments.png', height: 22.0, width: 22.0),*/
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 1.0,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customTextBold(
                    text: model.propertyName,
                    fontSize: 4.5,
                    textColor: BLACK),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 1.0,
                ),
                customTextMedium(
                    text: model.propertyAddress,
                    fontSize: 3.5,
                    textColor: MyColors.grayDrakText),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 5.0,
                ),
                customTextMedium(
                    text: "Job complete on " + model.dateTime,
                    fontSize: 3.5,
                    textColor: MyColors.grayDrakText),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorResources.primaryColor,
            size: 20,
          ),
        ],
      ),
    );
  }

  void getTimeSheetList() async {
    setState(() {
      isLoading = true;
    });
    TimeSheetModel tempModel =
        await timeSheetBloc.getTimeSheet(startDate, endDate);
    // Navigator.of(context).pop();
    if (tempModel.data != null) {
      setState(() {
        timeSheetModel = tempModel;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void openDatePicker(bool _startDate) {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2020, 3, 5),
        maxTime: DateTime.now(),
        theme: DatePickerTheme(
            backgroundColor: Colors.white,
            doneStyle: TextStyle(color: Colors.black, fontSize: 16)),
        onChanged: (date) {
      print('change $date in time zone ' +
          date.timeZoneOffset.inHours.toString());
    }, onConfirm: (date) {
      print('confirm $date');

      if (_startDate) {
        setState(() {
          startDate = DateFormat('yyyy-MM-dd').format(date);
        });
      } else {
        setState(() {
          endDate = DateFormat('yyyy-MM-dd').format(date);
        });

        if (startDate != null) {
          getTimeSheetList();
        }
      }
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
}
