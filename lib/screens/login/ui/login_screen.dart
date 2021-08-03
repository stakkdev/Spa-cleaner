
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spa_app/core/base_ui/my_router.dart';
import 'package:spa_app/core/base_ui/route_constants.dart';
import 'package:spa_app/screens/login/bloc/login_bloc.dart';
import 'package:spa_app/screens/login/data/login_model.dart';
import 'package:spa_app/utils/Custom_widget.dart';
import 'package:spa_app/utils/bottom_sheet.dart';
import 'package:spa_app/utils/constants.dart';
import 'package:spa_app/utils/custom_button.dart';
import 'package:spa_app/utils/SizeConfig.dart';
import 'package:spa_app/utils/Strings.dart';
import 'package:spa_app/utils/custom_color.dart';
import 'package:spa_app/utils/network_loader.dart';
import 'package:spa_app/utils/shared_pref_util.dart';
import 'package:spa_app/utils/string_extension.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isVisiblePassword = false;
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 8.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  customTextBold(
                    text: "Login",
                    fontSize: 9,
                    textColor: MyColors.BlackText,
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 1.0,
                  ),
                  customTextMedium(
                    text: "",
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
                  customPasswordField(
                    textEditingController: passwordController,
                    isVisible: false,
                    hint: 'Password',
                    onTap: () => {
                    },
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 9.0,
                  ),
                   RaisedGradientButton(
                       text: Strings().login,
                       onPressed: () => {
                         loginAction(),
                       },),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () => {
                      pushNamed(context, FORGOT_PASSWORD_SCREEN),
                    },
                    child: Center(
                      child: customTextMedium(
                          text: Strings().forgot_pass,
                          fontSize: 4.0,
                          textColor: MyColors.grayDrakText),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockHorizontal * 6.0,
                  ),
                ],
              ),
            ),
          ),

        )
      ),
    );
  }

  void loginAction() async {
   // Navigator.of(context).push(MaterialPageRoute(builder: (context) => AccountScreen()));
    // pushNamedAndClearStack(context, ACCOUNT_SCREEN);

    var userName =  emailController.text.trim();
    var password = passwordController.text.trim();
       userName = "testcleaner@yopmail.com";
       password ="P6Z41HLb";

    if (userName.length ==0 || password.length == 0) {
       displayCustomBottomSheet(
        context: context,
        description: "All fields required.",
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
    LoginModel loginResponse;
    loginResponse = await loginBloc.performLogin(userName, password);

    if (loginResponse.accessToken != null && loginResponse.accessToken.isNotEmpty) {
      await SharedPrefSingleton().setUserModelDetail(loginResponse.user);
      Navigator.of(context).pop();
      pushNamedAndClearStack(context, DASHBOARD_SCREEN);

    } else if(loginResponse.errorCode == Constants.INVALID_SESSION){
      Navigator.of(context).pop();
      displayCustomBottomSheet(
        context: context,
        description: "Please enter valid email and password.",
        negativeButtonText: "Ok",
      );
      return ;
    } else {
      Navigator.of(context).pop();
      displayCustomBottomSheet(
        context: context,
        description: loginResponse.errorDescription == null
            ? "Please enter valid email and password." : loginResponse.errorDescription,
        negativeButtonText: "Ok",
      );
    }
 }
}

/*
*
*    ingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                customTextBold(
                  text: "Welcome",
                  fontSize: 6.5,
                  textColor: MyColors.BlackText,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 1.0,
                ),
                customTextMedium(
                  text: Strings().welcome_des,
                  fontSize: 3.5,
                  textColor: MyColors.grayText,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 9.0,
                ),
                customEmailFiled(
                  textEditingController: emailController,
                  hint: "Enter Email Address",
                ),
                // emailTextEdit(
                //     textEditingController: loginController.emailController),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 6.0,
                ),
                customPasswordField(
                  textEditingController: passwordController,
                  isVisible: false,
                  hint: 'Enter Password',
                  onTap: () => {

                  },
                ),
                // Obx(
                //   () => passwordTextEdit(
                //     textEditingController: loginController.passwordController,
                //     isVisible: loginController.isPasswordVisible.value,
                //     onTap: () => {
                //       loginController.onPasswordTab,
                //     },
                //   ),
                // ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 9.0,
                ),
                // RaisedGradientButton(
                //     text: Strings().login,
                //     onPressed: () => {loginController.clickLoginButton()}),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 3.5,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () => {},
                    child: customTextMedium(
                        text: Strings().forgot_pass,
                        fontSize: 4.0,
                        textColor: MyColors.grayText),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockHorizontal * 6.0,
                ),
                GestureDetector(
                  onTap: () => {
                   // .goToNextScreen()
                  },
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        customTextMedium(
                          text: Strings().dont_have_account,
                          fontSize: 3.5,
                          textColor: MyColors.grayText,
                        ),
                        customTextBold(
                          text: Strings().create_new,
                          fontSize: 4.0,
                          textColor: blue9F9,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
*
* */