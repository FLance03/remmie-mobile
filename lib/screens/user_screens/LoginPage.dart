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

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  _login(BuildContext context, String email, String password) async {
    if (email != "asdfghj" && password != "sdfghjk") {
      print('Logging in...');
      String apiUrl = Api.login;
      var body = json.encode({"email": "guest@gmail.com", "password": "guest"});
      var res = await http.post(apiUrl, body: body);
      var data = jsonDecode(res.body);

      if (data['msg'] == "SUCCESS") {
        print("==== displaying data ====");
        print(data['id']);
        print(data['email']);
        print(data['password']);
        print(data['user_type']);
        print(data['first_name']);
        print(data['last_name']);
        print("=========================");

        var session = FlutterSession();
        await session.set("id", data['id']);
        await session.set("email", data['email']);
        await session.set("password", data['password']);
        await session.set("usertype", data['user_type']);
        await session.set("firstname", data['first_name']);
        await session.set("lastname", data['last_name']);
        
        apiUrl = Api.checkStatus;
        body = json.encode({"userid": data['id']});
        res = await http.post(apiUrl, body: body);
        data = jsonDecode(res.body);
        if (data['msg'] == "SUCCESS") {
          print("USER IS BOOKED");
          await session.set("isBooked", true);
        } else {
          print("USER IS NOT BOOKED");
           await session.set("isBooked", false);
        }

        print("Success! Logged in.");
        Navigator.pushNamed(context, '/Home');
        _email.clear();
        _password.clear();
      } else {
        print(res.statusCode);
        print("Unauthorized email or password.");
      }

      //Retrieving session data
      // dynamic sessionValue = await FlutterSession().get("first_name");
      // print(sessionValue);
      // sessionValue = await FlutterSession().get("last_name");
      // print(sessionValue);
      // sessionValue = await FlutterSession().get("email");
      // print(sessionValue);
      // sessionValue = await FlutterSession().get("password");
      // print(sessionValue);
    } else {
      print('No input. Please input email and password.');
    }
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
                          controller: _password),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    onPressed: () {
                      _login(context, _email.text, _password.text);
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
