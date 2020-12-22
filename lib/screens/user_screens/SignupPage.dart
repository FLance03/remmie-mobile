import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  int pageKey = 1;
  bool isComplete = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String reportFirst = '';
  String reportLast = '';
  String reportEmail = '';
  String reportPass = '';
  String reportConfirmPass = '';

  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  _confirm(BuildContext context) async {
    bool isOkay = true;
    String apiUrl = Api.signup;
    String firstName = _firstName.text;
    String lastName = _lastName.text;
    String email = _email.text;
    String password = _password.text;
    String confirmPassword = _confirmPassword.text;
    if (firstName == ''){
      setState(() {
        reportFirst = 'This field is required';
      });
      isOkay = false;
    }else {
      setState(() {
        reportFirst = '';
      });
    }
    if (lastName == ''){
      setState(() {
        reportLast = 'This field is required';
      });
      isOkay = false;
    }else {
      setState(() {
        reportLast = '';
      });
    }
    if (email == ''){
      setState(() {
        reportEmail = 'This field is required';
      });
      isOkay = false;
    }else {
      setState(() {
        reportEmail = '';
      });
    }
    if (password == ''){
      setState(() {
        reportPass = 'This field is required';
      });
      isOkay = false;
    }else {
      setState(() {
        reportPass = '';
      });
    }
    if (confirmPassword == ''){
      setState(() {
        reportConfirmPass = 'This field is required';
      });
      isOkay = false;
    }else {
      setState(() {
        reportConfirmPass = '';
      });
    }
    if (password != confirmPassword){
      setState(() {
        reportConfirmPass = 'Passwords does not match';
      });
      isComplete = false;
    }
    if (isOkay == true) {
      var body = json.encode({
        "first_name": firstName, 
        "last_name": lastName,
        "email": email,
        "password": password,
      });
      final res = await http.post(apiUrl, body: body);
      var data = jsonDecode(res.body);

      if (res.statusCode != 200){
        print("Error: "+res.statusCode.toString());
      }else if (data['success'] == false) {
        if (data['errorCode'] == 1) {
          reportEmail = data['error'];
        }
      }else {
          Navigator.pushReplacementNamed(context, '/');
        }
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Container(
            color: Color(0xFFF2F2F2),
            padding: EdgeInsets.only(top: 50.0),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.android,
                      size: 70.0,
                      color: Color(0xFF2F2F2F),
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
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      IconTextField(
                        hintText: "First Name",
                        icon: Icons.person,
                        vertical: 0,
                        bottomText: reportFirst,
                        controller: _firstName,
                      ),
                      IconTextField(
                        hintText: "Last Name",
                        icon: Icons.person,
                        vertical: 0,
                        bottomText: reportLast,
                        controller: _lastName,
                      ),
                      IconTextField(
                        hintText: "Email",
                        icon: Icons.email,
                        vertical: 0,
                        bottomText: reportEmail,
                        controller: _email,
                      ),
                      IconTextField(
                        hintText: "Password",
                        icon: Icons.lock,
                        vertical: 0,
                        bottomText: reportPass,
                        controller: _password,
                      ),
                      IconTextField(
                        hintText: "Confirm Password",
                        icon: Icons.lock,
                        vertical: 0,
                        bottomText: reportConfirmPass,
                        controller: _confirmPassword,
                      ),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () async {
                    await _confirm(context);
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text('SIGNUP',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF2F2F2F),
                        )),
                  ),
                ),
                RaisedButton(
                  onPressed: (){
                    _back(context);
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
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

