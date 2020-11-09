import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'remmie',
            style: TextStyle(
              letterSpacing: 1.0,
              color: Colors.black,
            )),
          centerTitle: true,
          // backgroundColor: Colors.red[600],
        ),
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Container(
            color: Color(0xFFF2F2F2),
            padding: EdgeInsets.symmetric(vertical: 80.0),
            constraints: BoxConstraints.expand(),
            child: Column(
              children: <Widget>[
                Text('hello world')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
