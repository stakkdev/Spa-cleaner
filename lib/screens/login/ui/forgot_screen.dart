
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spa_app/core/networking/base_response.dart';
import 'package:spa_app/screens/login/bloc/login_bloc.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/bottom_sheet.dart';
import 'package:spa_app/utils/custom_button.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/Strings.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/network_loader.dart';
import 'package:spa_app/utils/string_extension.dart';



class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LoginBloc loginBloc;
  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies() {
    loginBloc = Provider.of<LoginBloc>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar:  customAppBar(
            title: "Forgot password",
            onTab: ()=>{
              Navigator.of(context).pop(),
            }
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 150,
                ),
                customTextBold(
                  text: "Password Reset",
                  fontSize: 7,
                  textColor: MyColors.BlackText,
                ),
                SizedBox(
                  height: 15,
                ),
                customTextMedium(
                  text: "Enter your email below in order to reset your account.",
                  fontSize: 4,
                  textColor: MyColors.grayDrakText,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 9.0,
                ),
                customEmailFiled(
                  textEditingController: emailController,
                  hint: "Email Address",
                ),
                // emailTextEdit(
                //     textEditingController: loginController.emailController),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 6.0,
                ),
                 RaisedGradientButton(
                     text: "Submit",
                     onPressed: () => {
                      submitAction(),
                     },),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 3.5,
                ),
              ],
            ),
          ),

        )
      ),
    );
  }



  void submitAction() async {

    var userName =  emailController.text.trim();

    if (userName.length ==0 ) {
      displayCustomBottomSheet(
        context: context,
        description: "Enter email address.",
        negativeButtonText: "Ok",
      );
      return;
    }
    if (!validateEmail(userName)) {
      displayCustomBottomSheet(
        context: context,
        description: "Enter valid email address.",
        negativeButtonText: "Ok",
      );
      return ;
    }

    FocusScope.of(context).requestFocus(new FocusNode());
    displayLoader(context);

    String loginResponse = await loginBloc.forgotPassword(userName);
    Navigator.of(context).pop();
    if (loginResponse!= null) {
      displayCustomBottomSheet(
        context: context,
        description: loginResponse,
        negativeButtonText: "Ok",
      );
    }
  }
}