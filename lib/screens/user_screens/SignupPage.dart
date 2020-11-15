import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int pageKey = 1;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Container(
            color: Color(0xFFF2F2F2),
            padding: EdgeInsets.symmetric(vertical: 80.0),
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[Text('this is the sign up page')],
            ),
          ),
        ),
      ),
    );
  }
}

_next(BuildContext context) {
  //Refresh screen to load new screens (using page key)

}

_confirm(BuildContext context) {
  Navigator.pop(context);
}
