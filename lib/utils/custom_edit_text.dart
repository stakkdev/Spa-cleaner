import 'package:flutter/material.dart';

class CustomEditText extends StatefulWidget {
   final String hintText;
  TextEditingController controller = new TextEditingController();
   TextInputType inputType;
   final TextInputAction inputAction;

  CustomEditText(
      {@required this.hintText,
        this.controller,
        this.inputType,
        this.inputAction});

  @override
  _CustomEditTextState createState() => _CustomEditTextState();
}

class _CustomEditTextState extends State<CustomEditText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.4),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              bottomRight: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              topLeft: Radius.circular(40.0)),
          color: Colors.white),
      height: 150,
      child: TextField(
        controller: widget.controller,
        textAlign: TextAlign.start,
        keyboardType: widget.inputType,
        textInputAction: widget.inputAction,
        //inputType: TextInputType.emailAddress,inputAction:TextInputAction.next,
        // onSubmitted: (_) => FocusScope.of(context).nextFocus(),
        style: TextStyle(
          color: Colors.black,
          fontFamily: "Medium",
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 13,
            color: Colors.grey,
            fontFamily: "Medium",
          ),
          hintText: widget.hintText,
          contentPadding: EdgeInsets.only(left: 20.0,right: 20),
        ),
      ),
    );
  }
}
