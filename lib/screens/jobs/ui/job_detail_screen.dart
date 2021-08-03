
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/screens/jobs/bloc/job_bloc.dart';
import 'package:spa_app/screens/jobs/data/job_detail.dart';

import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/bottom_sheet.dart';

import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/my_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class JobDetailScreen extends StatefulWidget {
  final String jobId;
  JobDetailScreen(this.jobId);
  @override
  _JobDetailScreenState createState() => _JobDetailScreenState();
}

class _JobDetailScreenState extends State<JobDetailScreen> {
  Completer<GoogleMapController> _controller = Completer();
  final Location location = Location();
  JobBloc jobBloc;
  JobDetailModel jobDetailModel;
  bool isLoading = true;
  bool jobStarted = false;
  List<Marker> _markers = <Marker>[];
  Set<Circle> circles = Set<Circle>();
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    jobBloc = JobBloc();
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      // do stuff after frame is build
      if (jobDetailModel == null) getJobDetail();
    });
    checkLocation();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.white,
      appBar: customAppBar(
          title: "Job Details",
          onTab: () =>
          {
            Navigator.of(context).pop(),
          }
      ),
      body: isLoading ? Center(
        child: CircularProgressIndicator(),
      ) : Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: _bodyWidget(context),
      ),
      floatingActionButton: Visibility(
        visible: !isLoading,
        child: FloatingActionButton.extended(

          onPressed: () {
            jobAction();
          },
          label: Text(jobStarted ? 'Stop Job' : 'Start Job',
            style: TextStyle(color: Colors.white),),
          icon: const Icon(Icons.deck_sharp, color: Colors.white,),
          backgroundColor: Colors.blue,

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  markerFlow() {
    _markers.add(
        Marker(
            markerId: MarkerId('SomeId'),
            position: LatLng(double.parse(jobDetailModel.data.latitude),
                double.parse(jobDetailModel.data.longitude)),
            infoWindow: InfoWindow(
                title: jobDetailModel.data.propertyName
            )
        )
    );
   // circlesFlow();
  }

  circlesFlow() {
    circles.add(Circle(
        circleId: CircleId("1"),
        center: LatLng(double.parse(jobDetailModel.data.latitude),
            double.parse(jobDetailModel.data.longitude)),
        radius: 1000,
        fillColor: Colors.indigoAccent.withOpacity(0.2),
        strokeWidth: 2,
        strokeColor: Colors.indigoAccent));
  }

  _bodyWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        height: SizeConfig.screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1,),
            Container(
              height: 350,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(double.parse(jobDetailModel.data.latitude),
                      double.parse(jobDetailModel.data.longitude)),
                  zoom: 18,
                ),
                markers: Set<Marker>.of(_markers),
                circles: circles,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            // Image.asset("assets/map.png", fit: BoxFit.cover, width: MediaQuery.of(context).size.width,height: 300,),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: customTextBold(
                  text: jobDetailModel.data.propertyName,
                  fontSize: 5.0,
                  textColor: black20),

            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: customTextBold(
                  text: jobDetailModel.data.address,
                  fontSize: 4.0,
                  textColor: black20),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: customTextRegular(
                  text: jobDetailModel.data.details,
                  fontSize: 4.0,
                  textColor: Colors.black45),
            ),
            // Divider( height: 1,),
            SizedBox(height: 10,),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: customTextRegular(
            //       text: 'XYXn street 24242 0t4 fdne033 ', fontSize: 4.0, textColor: Colors.black45),
            // ),
          ],
        ),
      ),
    );
  }

  void getJobDetail() async {
    JobDetailModel tempJobModel = await jobBloc.getJobDetail(widget.jobId);
    // Navigator.of(context).pop();
    if (tempJobModel.data != null) {
      setState(() {
        jobDetailModel = tempJobModel;
        isLoading = false;
        jobStarted = tempJobModel.data.isStarted == "0" ? false : true;
      });
      markerFlow();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void jobAction() async {
    //  BaseResponse response  = await jobBloc.startJob(jobStarted, "$jobId");
    print(jobStarted);
    String msg;
    if (jobStarted) {
      msg = "Are you sure to Stop the current Job?";
      displayCustomBottomSheet(
        context: context,
        description: msg,
        negativeButtonText: "Cancel",
        positiveButtonText: "Yes",
        callbackPositive: () async {
          Navigator.of(context).pop();
          BaseResponse response = await jobBloc.startJob(
              jobStarted, widget.jobId);
          jobStarted = !jobStarted;
          setState(() {
            jobStarted = jobStarted;
          });
        },
      );
    } else {
      // to start job

      BaseResponse response = await jobBloc.startJob(jobStarted, widget.jobId);
      if (response.statusCode == "200") {
        msg = "Job time has been save successfully";
        jobStarted = !jobStarted;
        setState(() {
          jobStarted = jobStarted;
        });
      } else {
        msg = "There is server error, Please try again";
      }

      displayCustomBottomSheet(
        context: context,
        description: msg,
        negativeButtonText: "Ok",);
    }
  }

  void checkLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }

      _locationData = await location.getLocation();

    }
  }

  void calculateDistance() async{
    checkLocation();

    if (_locationData!=null) {


    }
  }
}
