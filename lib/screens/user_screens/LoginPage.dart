import 'package:flutter/material.dart';
import '../../widgets/custom_widgets/IconTextField.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    padding: EdgeInsets.only(bottom: 75.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: <Widget>[
                          IconTextField(
                            hintText: "Email",
                            icon: Icons.email,
                          ),
                          IconTextField(
                            hintText: "Password",
                            icon: Icons.lock,
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => _login(context),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 40.0),
                      child: Text('LOGIN',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF2F2F2F),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Haven't registered yet? "),
                        InkWell(
                          onTap: () => _signup(context),
                          child: Text(
                            "Tap Here",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

_login(BuildContext context){
  //If Login Authetication returns true
  Navigator.pushNamed(context, '/Home');
}

_signup(BuildContext context){
  //If Login Authetication returns true
  Navigator.pushNamed(context, '/Signup');
}