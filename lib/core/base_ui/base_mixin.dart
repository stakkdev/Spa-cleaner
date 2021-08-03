
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spa_app/core/base_ui/route_constants.dart';
import 'package:spa_app/utils/bottom_sheet.dart';
import 'package:spa_app/utils/constants.dart';
import 'package:spa_app/utils/my_color.dart';
import 'base_page.dart';
import 'my_router.dart';

mixin BasicPage<Page extends BasePage> on BaseState<Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool isErrorDialogDisplayed = false;

  // ignore: non_constant_identifier_names
  double BASE_PADDING = 8.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//    double width = MediaQuery
//        .of(context)
//        .size
//        .width;

    return Scaffold(
      key: _scaffoldKey,
      appBar:AppBar(),
      backgroundColor: ColorResources.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: BASE_PADDING, vertical: 16),
                  child: body(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: floatingActionButton(),
    );
  }
  Widget floatingActionButton(){
    return Container();
  }




  Widget getCustomToolBar({bool isNavDrawerRequired }) {
    return AppBar();
  }
  /// This is mandatory to override. All your UI building will go in this method
  /// DON'T OVERRIDE normal Widget build(BuildContext context) {}
  Widget body();

  /// Use this to get data from internet and update the UI - like opening the screen for first time
  /// This method will handle all the error thrown by server
  /// It will automatically handle Scale Animation for you
//  Widget getBasicStreamBuilder({@required Stream<dynamic> stream, @required Function(dynamic response) successResponse}) {
//    Widget blank = LoaderProgressBar();
//
//    try {
//      return StreamBuilder(
//        stream: stream,
//        builder: (context, AsyncSnapshot<dynamic> snapshot) {
//          if (snapshot.hasData) {
//            if ((snapshot.data as BaseResponse).errorCode == null) {
//              blank = successResponse(snapshot.data);
//            } else {
//              getErrorMessage((snapshot.data as BaseResponse).errorCode).then((errorMessage) {
//                if ((snapshot.data as BaseResponse).errorCode == 'MBE_300') {
//                  // This is temporary fix for Payment history error in overview screen
//                  return;
//                }
//                displayError(errorMessage);
//              });
//              blank = Container();
//              blank = successResponse(snapshot.data);
////              return blank;
//            }
//          } else if (snapshot.hasError) {
//            displayError(snapshot.error);
//            blank = Container();
//            return blank;
//          }
//          return AnimatedSwitcher(
//            child: blank,
//            duration: Duration(milliseconds: 300),
//            transitionBuilder: (Widget child, Animation<double> animation) => ScaleTransition(
//              scale: animation,
//              child: child,
//            ),
//          );
//        },
//      );
//    } catch (ex) {
//      displayError(ex.toString());
//      return Container();
//    }
//  }

  /// This method will display error in form of Bottom Sheet dialog
  // ignore: missing_return
  Future<Widget> displayError(String errorMessage, {GestureTapCallback callback}) {
    if (!isErrorDialogDisplayed) {
      isErrorDialogDisplayed = true;

      if (callback == null) {
        callback = () {
          Navigator.pop(context);
        };
      }

      return displayCustomBottomSheet(
          context: context,
          title: "Error",
          description: errorMessage,
          positiveButtonText: "Okay",
          callbackPositive: () {
            if (errorMessage == Constants.INVALID_SESSION_DESCRIPTION) {
              pushNamedAndClearStack(context, LOGIN_SCREEN);
            } else {
              return callback;
            }
          }
      );
    }
  }
  /// This method will display success in form of Bottom Sheet dialog
  Future<Widget> displayAlert(String msg, {GestureTapCallback callback}) {
    return displayCustomBottomSheet(
        context: context,
        title: "Confirm",
        description: msg,
        positiveButtonText: 'Okay',
        callbackPositive: callback ?? () {
          Navigator.pop(context);
        },
        negativeButtonText: "cancel"
    );
  }
  /// This method will display success in form of Bottom Sheet dialog
  Future<Widget> displaySuccess(String successMessage, {GestureTapCallback callback}) {
    return displayCustomBottomSheet(
        context: context,
        title: 'Success',
        description: successMessage,
        positiveButtonText: 'Okay',
        callbackPositive: callback ?? () {
          Navigator.pop(context);
        }
    );
  }
}


/// Enum to manage, whether we need to display icon in toolbar or not on the right side
//enum RightIcon { SHOW, HIDE }
