
import 'package:flutter/material.dart';
import 'package:spa_app/utils/text_styles.dart';

import 'button_widgets.dart';
import 'custom_button.dart';
import 'my_color.dart';

Future<Widget> displayCustomBottomSheet(
    {BuildContext context,
    String title,
    String description,
    String positiveButtonText,
    String negativeButtonText,
    GestureTapCallback callbackPositive,
    GestureTapCallback callbackNegative}) {

  // If callback are null, at-least initialize them to hide the bottom sheet
  if (callbackPositive == null)
    callbackPositive = () {
      Navigator.pop(context);
    };

  if (callbackNegative == null)
    callbackNegative = () {
      Navigator.pop(context);
    };

  return showModalBottomSheet(
      context: context,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      builder: (builder) {
        return Container(
          margin: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              getBoldText(title, BLACK, 18),
              SizedBox(
                height: 8.0,
              ),
              getNormalCenterAlignedText(description, BLACK, 16),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (null != positiveButtonText)
                Expanded(
                child: RaisedGradientButton(
                text: positiveButtonText,
                onPressed: callbackPositive,),),
                      // Expanded(
	                    //   child: getRa(
                      //     context: context,
                      //     text: positiveButtonText,
                      //     callBack: callbackPositive,
                      //     type: ButtonType.PRIMARY
                      //   ),
                      // ),
                    if (null != negativeButtonText)
                      SizedBox(
                        width: 20,
                      ),
                    if (null != negativeButtonText)
                      // Expanded(
                      //   child: getGenericButtonWidget(
                      //       context: context,
                      //       text: negativeButtonText,
                      //       callBack: callbackNegative,
                      //       type: ButtonType.SECONDARY
                      //   ),
                      // ),
                      Expanded(
                        child: RaisedGradientButton(
                          text: negativeButtonText,
                          onPressed: callbackNegative,),
                      ),

                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],

          ),
        );
      });
}



Future<void> showMyDialog(BuildContext context, String title, String message, bool okButton ) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          if (okButton)
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          TextButton(
            child: const Text('ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}


void showToast(BuildContext context, String msg) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(msg),
      action: SnackBarAction(label: 'ok', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
