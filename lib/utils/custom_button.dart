import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Custom_widget.dart';
import 'SizeConfig.dart';
import 'custom_color.dart';


class RaisedGradientButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const RaisedGradientButton({
     Key key,
     this.text,
     this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
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
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: customTextBold(text: text, fontSize: 5.0, textColor: MyColors.white),
          ),
        ),
      ),
    );
  }
}
