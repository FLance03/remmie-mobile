import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class CompletePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('remmie',
              style: TextStyle(
                letterSpacing: 1.0,
                color: Colors.black,
              )),
          centerTitle: true,
          leading: new Container(),
        ),
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                  child: Text(
                'You have successfully booked your stay at Holiday Plaza Hotel! \nShow this QR code upon arrival at the hotels front desk.',
                textAlign: TextAlign.center,
              )),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(10)),
                ),
                child: Image.asset(
                  "assets/qrcode.png",
                  width: 300,
                  height: 300,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Text('Date of Stay:'),
              Center(child: Text('September 01, 2020 - September 07, 2020')),
              RaisedButton(
                onPressed: () => _home(context),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Text('Back to Home',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2F2F2F),
                      )),
                ),
              ),
            ],
          ),
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
      ),
    );
  }
}

_home(BuildContext context) {
  //If Login Authetication returns true
  Navigator.pushReplacementNamed(context, '/Home');
}
