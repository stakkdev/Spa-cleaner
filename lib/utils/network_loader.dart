import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isAndroid
          ? CircularProgressIndicator()
          : CupertinoTheme(
              data: CupertinoTheme.of(context).copyWith(brightness: Brightness.light),
              child: CupertinoActivityIndicator(
                radius: 12,
              ),
            ),
    );
  }
}

displayLoader(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => Material(
            type: MaterialType.transparency,
            child: Center(
              child: LoaderProgressBar(),
            ),
          ));
}
