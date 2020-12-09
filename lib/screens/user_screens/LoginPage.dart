import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String apiUrl = Api.login;
  String email = "fletcher";
  String password = "123";

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  var body = json.encode({"firstname": "fletcher@gmail.com", "password": "123"});

  _login(BuildContext context) async {
    print('Logging in...');
    final res = await http.post(apiUrl, body: body);
    // var data = jsonDecode(res.body);

    // if (res.statusCode == 200) {
    //   print('hello world');
    // } else {
    //   print(res.statusCode);
    // }

    // FlutterSession().set('data', 'hi thereeeeeeeee');

    // var someValue = FlutterSession().get('data');
    // print(someValue.toString());
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          color: Color(0xFFF2F2F2),
          padding: EdgeInsets.symmetric(vertical: 50.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.android,
                      size: 80.0,
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
                        hintText: "Email",
                        icon: Icons.email,
                        controller: _email,
                        vertical: 20.0,
                      ),
                      IconTextField(
                        hintText: "Password",
                        icon: Icons.lock,
                        controller: _password
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: () async {
                      // await connect();
                      // var results = await conn.query("INSERT INTO users(first_name,last_name,email,password) VALUES('aa','aa','aa','aa')");
                      // print(results);
                      _login(context);
                    },
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Haven't registered yet?   "),
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
              ]),
        ),
      ),
    );
  }
}

_signup(BuildContext context) {
  //If Login Authetication returns true
  Navigator.pushNamed(context, '/Signup');
}
