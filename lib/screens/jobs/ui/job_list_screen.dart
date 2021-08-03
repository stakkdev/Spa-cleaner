import 'package:flutter/material.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'job_detail_screen.dart';
import 'job_week_screen.dart';
import 'jobs_screen.dart';

class JobListScreen extends StatefulWidget {
  @override
  _JobListScreenState createState() => _JobListScreenState();
}

class _JobListScreenState extends State<JobListScreen> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    MyColors.DarkBlueBg,
                    MyColors.LightBlueBg,
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            centerTitle: true,
            leading: null,
            title: customTextBold(
                text: "Jobs", fontSize: 5.0, textColor: white),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: "Today Jobs",
                ),
                Tab(
                  text: "My Jobs",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              JobList(),
              JobWeekScreen(),
            ],
          ),
        ),
      );
    }


  Widget _singleRow(int index) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        padding:
        EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 3.0),
        child: Row(
          children: [
           /* Container(
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
                      text: 'A new Job Assigned for location  ', fontSize: 4.0, textColor: black20),
                  SizedBox(height: SizeConfig.safeBlockHorizontal * 0.7,),
                  customTextRegular(
                      text: 'Xyz Street2 area 15 km',
                      fontSize: 3.5,
                      textColor: Colors.black45),
                  SizedBox(height: SizeConfig.safeBlockHorizontal * 1,),
                  SizedBox(height: SizeConfig.safeBlockHorizontal * 1,),
                  customTextRegular(
                      text: '15 min ago',
                      fontSize: 3.5,
                      textColor: Colors.black54),
                ],
              ),
            ),
              Icon(Icons.arrow_forward_ios, color: Colors.black45, size: 20,),
          ],
        ),
      ),
    );
  }
}


