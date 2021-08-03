import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'SizeConfig.dart';
import 'custom_color.dart';

TextStyle customTextStyleRegular(
    {@required var fontSize, @required Color textColor}) {
  return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontFamily: 'Regular',
      fontWeight: FontWeight.w500);
}

TextStyle customTextStyleRegularBold(
    {@required var fontSize, @required Color textColor}) {
  return TextStyle(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontFamily: 'Regular',
      fontWeight: FontWeight.bold);
}

TextStyle customTextStyleBold(
    {@required var fontSize, @required Color textColor}) {
  return GoogleFonts.ubuntu(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontWeight: FontWeight.w500);
}

TextStyle customTextStyleSemiBold(
    {@required var fontSize, @required Color textColor}) {
  return GoogleFonts.ubuntu(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      fontWeight: FontWeight.w200);
}

TextStyle customTextStyleMedium(
    {@required var fontSize, @required Color textColor}) {
  return GoogleFonts.ubuntu(
      fontSize: SizeConfig.safeBlockHorizontal * fontSize,
      color: textColor,
      height: 1.5,
      fontWeight: FontWeight.w400);
}

Widget customTextRegular({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: customTextStyleRegular(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextRegularCenterBold({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleRegularBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextBold({
  @required var text,
  @required var fontSize,
  Color textColor,
}) {
  return Text(
    text,
    style: customTextStyleBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextBoldCenter({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextSemiBold({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style: customTextStyleSemiBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextSemiBoldCenter({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleSemiBold(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextMedium({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    style: customTextStyleMedium(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}


Widget customTextBorderClick({
  @required var text,
  @required var fontSize,
  @required Color textColor,
  Function onPressed
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      height: 40,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: white,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: customTextStyleMedium(
          fontSize: fontSize,
          textColor: textColor,
        ),
      ),
    ),
  );
}

Widget customTextMediumSingleLine({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: customTextStyleMedium(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget customTextMediumCenter({
  @required var text,
  @required var fontSize,
  @required Color textColor,
}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: customTextStyleMedium(
      fontSize: fontSize,
      textColor: textColor,
    ),
  );
}

Widget assetImage({var image, var height, var width}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    fit: BoxFit.contain,
  );
}

Widget assetImageColor({var image, var height, var width, var color}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    fit: BoxFit.contain,
    color: color,
  );
}

Widget assetImageVisible({var image, var height, var width, Color color}) {
  return Image.asset(
    image,
    height: height,
    width: width,
    fit: BoxFit.contain,
    color: color,
  );
}

Widget customEmailFiled(
    {TextEditingController textEditingController, var hint}) {
  // @required
  return Container(
    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
          child: assetImage(
              image: 'assets/ic_mail.png',
              height: SizeConfig.safeBlockHorizontal * 4.5,
              width: SizeConfig.safeBlockHorizontal * 4.5),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: black20),
            decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customPasswordField(
    {TextEditingController textEditingController,
    var hint,
    var isVisible, Function onTap}) {
  // @required
  return Container(
    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
          child: assetImage(
              image: 'assets/ic_lock.png',
              height: SizeConfig.safeBlockHorizontal * 4.5,
              width: SizeConfig.safeBlockHorizontal * 4.5),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            obscureText: true,
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: MyColors.black),
            decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
        // isVisible
        //     ? Container(
        //         padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
        //         child: assetImage(
        //             image: 'assets/ic_visible.png',
        //             height: SizeConfig.safeBlockHorizontal * 4.5,
        //             width: SizeConfig.safeBlockHorizontal * 5.0),
        //       )
        //     : Container(
        //         padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
        //         child: assetImageVisible(
        //             image: 'assets/ic_visible.png',
        //             height: SizeConfig.safeBlockHorizontal * 5.0,
        //             width: SizeConfig.safeBlockHorizontal * 5.0),
        //       ),
      ],
    ),
  );
}

Widget customNumberFiled(
    {TextEditingController textEditingController, var hint}) {
  // @required
  return Container(
    padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3.5),
          child: assetImage(
              image: 'assets/ic_cellphone.png',
              height: SizeConfig.safeBlockHorizontal * 5.0,
              width: SizeConfig.safeBlockHorizontal * 5.0),
        ),
        Expanded(
          flex: 1,
          child: TextField(
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: MyColors.black),
            textAlign: TextAlign.start,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            decoration: new InputDecoration(
              counterText: "",
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget commonTextFiled(
    {TextEditingController textEditingController, var hint}) {
  // @required
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 7.0,
        vertical: SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 0.6),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: TextField(
      controller: textEditingController,
      style: customTextStyleRegular(fontSize: 4.0, textColor: MyColors.black),
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hint,
        hintStyle:
            customTextStyleRegular(fontSize: 4.0, textColor: MyColors.grayText),
      ),
    ),
  );
}

Widget customSearch(
    {TextEditingController textEditingController,
    var hint,
    Function onFieldSubmitted}) {
  // @required
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: bgSearch),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: bgSearch,
    ),
    child: Row(
      children: [
        Container(
          padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.3),
          child: assetImage(
              image: 'assets/ic_search.png',
              height: SizeConfig.safeBlockHorizontal * 4.7,
              width: SizeConfig.safeBlockHorizontal * 4.7),
        ),
        Expanded(
          flex: 1,
          child: TextFormField(
            controller: textEditingController,
            style: customTextStyleRegular(
                fontSize: 4.0, textColor: MyColors.black),
            maxLines: 1,
            onFieldSubmitted: (_) =>
                {if (onFieldSubmitted != null) onFieldSubmitted()},
            decoration: new InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: customTextStyleRegular(
                  fontSize: 4.0, textColor: MyColors.grayText),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customEditTextField({
  TextEditingController textEditingController,
  var hint,
}) {
  // @required
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal * 5.0,
        vertical: SizeConfig.safeBlockHorizontal * 0.5),
    decoration: BoxDecoration(
      border: Border.all(color: borderColor, width: 1.5),
      borderRadius: BorderRadius.all(Radius.circular(100)),
      color: white,
    ),
    child: TextFormField(
      controller: textEditingController,
      style: customTextStyleRegular(fontSize: 4.0, textColor: MyColors.black),
      maxLines: 1,
      decoration: new InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hint,
        hintStyle:
            customTextStyleRegular(fontSize: 4.0, textColor: MyColors.grayText),
      ),
    ),
  );
}

Widget backArrowAppBarAuth({@required Function onTab}) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      color: MyColors.BlueAppColor,
      size: SizeConfig.safeBlockHorizontal * 6.0,
    ),
    onPressed: () => {
     // Get.back(),
    },
  );
}

Widget backArrowAppBar({@required Function onTab}) {
  return IconButton(
    icon: Icon(
      Icons.arrow_back_ios,
      color: white,
      size: SizeConfig.safeBlockHorizontal * 6.0,
    ),
    onPressed: () => onTab(),
  );
}

AppBar customAppBar({@required var title, @required Function onTab, bool showBackBtn = true  }) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.DarkBlueBg,
            MyColors.LightBlueBg,
          ],
        ),
      ),
    ),
    centerTitle: true,
    leading: showBackBtn ? backArrowAppBar(onTab: onTab) : null,

    title: customTextBold(text: title, fontSize: 5.0, textColor: white),
  );
}
AppBar customAppBarAction({@required var title, @required Function onTab, bool showBackBtn = true , Widget actionType }) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.DarkBlueBg,
            MyColors.LightBlueBg,
          ],
        ),
      ),
    ),
    centerTitle: true,
    leading: showBackBtn ? backArrowAppBar(onTab: onTab) : null,
    actions: [
      actionType
    ],
    title: customTextBold(text: title, fontSize: 5.0, textColor: white),
  );
}


AppBar customAppBarTransparent(
    {@required var title, @required Function onTab}) {
  return AppBar(
    flexibleSpace: Container(
      color: Colors.transparent,
    ),
    centerTitle: true,
    leading: backArrowAppBar(onTab: onTab),
    title: customTextSemiBold(text: title, fontSize: 5.0, textColor: white),
  );
}

AppBar customAppBarWithIcon(
    {@required var title, @required Function onTab,  Function onAction}) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.DarkBlueBg,
            MyColors.LightBlueBg,
          ],
        ),
      ),
    ),
    centerTitle: true,
    leading: backArrowAppBar(onTab: onTab),
    title: customTextSemiBold(text: title, fontSize: 5.0, textColor: white),
    actions: <Widget>[
      GestureDetector(
        onTap: ()=> onAction,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 5.0),
          child: assetImage(
            image: 'assets/ic_filter_white.png',
            width: SizeConfig.safeBlockHorizontal * 6.5,
            height: SizeConfig.safeBlockHorizontal * 6.5,
          ),
        ),
      )
    ],
  );
}

AppBar customAppBarWith2Icon(
    {@required var title,
    @required Function onTab,
    Function onAction1,
    Function onAction2}) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.DarkBlueBg,
            MyColors.LightBlueBg,
          ],
        ),
      ),
    ),
    centerTitle: true,
    leading: backArrowAppBar(onTab: onTab),
    title: customTextSemiBold(text: title, fontSize: 5.0, textColor: white),
    actions: <Widget>[
      GestureDetector(
        onTap:()=> onAction1,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 5.0),
          child: assetImage(
            image: 'assets/ic_filter_white.png',
            width: SizeConfig.safeBlockHorizontal * 6.5,
            height: SizeConfig.safeBlockHorizontal * 6.5,
          ),
        ),
      ),
      SizedBox(
        width: SizeConfig.safeBlockHorizontal * 3.0,
      ),
      GestureDetector(
        onTap:()=> onAction2,
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 5.0),
          child: assetImage(
            image: 'assets/ic_filter_white.png',
            width: SizeConfig.safeBlockHorizontal * 6.5,
            height: SizeConfig.safeBlockHorizontal * 6.5,
          ),
        ),
      )
    ],
  );
}

AppBar customAppBarWithoutBack({@required var title}) {
  return AppBar(
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            MyColors.DarkBlueBg,
            MyColors.LightBlueBg,
          ],
        ),
      ),
    ),
    centerTitle: true,
    title: customTextSemiBold(text: title, fontSize: 5.0, textColor: white),
  );
}

Widget customDivider() {
  return Container(
    color: dividerColor,
    height: SizeConfig.safeBlockHorizontal * 0.1,
  );
}

Widget circleImage({var image, var width, var height}) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * width,
    height: SizeConfig.safeBlockHorizontal * height,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: new DecorationImage(
        fit: BoxFit.fill,
        image: new AssetImage(image),
      ),
    ),
  );
}

Widget squareImage({var image, var width, var height}) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * width,
    height: SizeConfig.safeBlockHorizontal * height,
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      border: Border.all(color: borderColor, width: 0.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      image: new DecorationImage(
        fit: BoxFit.fill,
        image: new AssetImage(image),
      ),
    ),
  );
}

Widget circleAssetIcon({var image, var width, var height, Function onTap}) {
  return GestureDetector(
    onTap: ()=> onTap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
          color: bgSearch),
      padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
      child: assetImage(
          image: image,
          height: SizeConfig.safeBlockHorizontal * width,
          width: SizeConfig.safeBlockHorizontal * height),
    ),
  );
}

Widget circleAssetIconWithoutPadding(
    {var image, var width, var height, Function onTap}) {
  return GestureDetector(
    onTap:()=> onTap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(100.0),
          ),
          color: bgSearch),
      // padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 4.0),
      child: assetImage(
          image: image,
          height: SizeConfig.safeBlockHorizontal * width,
          width: SizeConfig.safeBlockHorizontal * height),
    ),
  );
}

Widget roundCornerButton({var text}) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: bgSearch),
      borderRadius: BorderRadius.all(
        Radius.circular(100),
      ),
      color: bgSearch,
    ),
  );
}

Widget iconWithoutPadding({var image, var size}) {
  return assetImage(
    image: image,
    height: SizeConfig.safeBlockHorizontal * size,
    width: SizeConfig.safeBlockHorizontal * size,
  );
}

Widget roundButton({String text, Function onTap}) {
  return GestureDetector(
    onTap: ()=> onTap,
    child: Center(
      child: Container(
        padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 3.1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
              colors: <Color>[
                MyColors.DarkBlueBg,
                MyColors.LightBlueBg,
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ]),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 10.0),
          child: customTextSemiBold(
              text: text, fontSize: 5.0, textColor: MyColors.white),
        ),
      ),
    ),
  );
}


Widget getCircleImage (String path) {
  return CachedNetworkImage(
    imageUrl: path,
    imageBuilder: (context, imageProvider) => Container(
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: imageProvider, fit: BoxFit.cover),
      ),
    ),
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.account_circle),
  );
}