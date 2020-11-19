import 'package:flutter/material.dart';
import '../../widgets/custom_widgets/IconTextField.dart';

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
            padding: EdgeInsets.symmetric(vertical: 50.0),
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Expanded(
                    child: Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Icon(
                            Icons.android,
                            size: 80.0,
                            color: Color(0xFF2F2F2F),
                          ),
                        ),
                        Text(
                          'remmie',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          IconTextField(
                            hintText: "First Name",
                            icon: Icons.person,
                          ),
                          IconTextField(
                            hintText: "Last Name",
                            icon: Icons.person,
                          ),
                          IconTextField(
                            hintText: "Password",
                            icon: Icons.lock,
                          ),
                          IconTextField(
                            hintText: "Confirm Password",
                            icon: Icons.lock,
                          ),
                          IconTextField(
                            hintText: "Email",
                            icon: Icons.email,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _confirm(context),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0),
                      child: Text('SIGNUP',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F2F2F),
                          )),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _back(context),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.0),
                      child: Text('BACK',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F2F2F),
                          )),
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}

_back(BuildContext context) {
  //Refresh screen to load new screens (using page key)
  Navigator.pop(context);
}

_confirm(BuildContext context) {
  Navigator.pop(context);
}
