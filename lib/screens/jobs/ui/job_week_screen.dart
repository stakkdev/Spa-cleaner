import 'package:flutter/material.dart';
import 'package:spa_app/core/base_ui/my_router.dart';
import 'package:spa_app/core/base_ui/route_constants.dart';
import 'package:spa_app/screens/jobs/bloc/job_bloc.dart';
import 'package:spa_app/screens/jobs/data/job_model.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/constants.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/my_color.dart';
import 'job_detail_screen.dart';
import 'jobs_screen.dart';

class JobWeekScreen extends StatefulWidget {
  @override
  _JobWeekScreenState createState() => _JobWeekScreenState();
}

class _JobWeekScreenState extends State<JobWeekScreen>with AutomaticKeepAliveClientMixin<JobWeekScreen>  {
  JobModel jobModel;
  JobBloc jobBloc;
  bool showNoJobToday = false;
  @override
  void initState(){
    super.initState();
    jobBloc = JobBloc();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      if(jobModel== null)getJobList(Constants.WeekJob);
    });

  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: jobModel== null ? noJobText() : ListView.builder(

              padding: const EdgeInsets.all(8),
              itemCount: jobModel.jobs.length,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _singleRow(index, context);
              }),
        ),
      ),
    );
  }
  Widget noJobText() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          if(!showNoJobToday)CircularProgressIndicator(),
          SizedBox(
            height: 10,
          ),
          Text(showNoJobToday ? "No future jobs assigned" :"Please wait ..."),
        ],),
    );
  }

  Widget _singleRow(int index, BuildContext context) {
    var jobListModel = jobModel.jobs[index];
    return GestureDetector(
      onTap: (){
       pushNamed(context, JOB_DETAIL_SCREEN, args: jobListModel.jobId);
      },
      child: Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3.0),
        margin:
        EdgeInsets.symmetric(vertical: SizeConfig.safeBlockHorizontal * 1.5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: borderColor, width: 0.2),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
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
                      text: jobListModel.propertyName,
                      fontSize: 4.5,
                      textColor: BLACK),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 1.0,
                  ),
                  customTextMedium(
                      text: jobListModel.address,
                      fontSize: 3.5,
                      textColor: MyColors.grayDrakText),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 5.0,
                  ),
                  customTextMedium(
                      text: jobListModel.date,
                      fontSize: 3.5,
                      textColor: MyColors.grayDrakText),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios , color:  ColorResources.primaryColor, size: 20,),
          ],
        ),
      ),
    );
  }

  void getJobList(String s) async {
    // displayLoader(context);
    JobModel tempJobModel= await jobBloc.getJobList(s);
    // Navigator.of(context).pop();
    if (tempJobModel.jobs.isNotEmpty) {
      setState(() {
        jobModel = tempJobModel;
        showNoJobToday = false;
      });
    } else {
      setState(() {
        showNoJobToday = true;
      });
    }

  }

  @override
  bool get wantKeepAlive => true;
}