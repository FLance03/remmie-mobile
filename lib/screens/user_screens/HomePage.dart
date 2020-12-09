import 'dart:async';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../widgets/widgets.dart';

final isBooked = true;

class HomePage extends StatelessWidget {
  // Future<List> senddata() async {
  //   final response = await http.post("http://192.168.0.153/flutter/remmie/insertdata.php", body: {
  //     "name": 'name.text',
  //   });
  //   var message = jsonDecode(response.body);
 
  //   // If Web call Success than Hide the CircularProgressIndicator.
  //   if(response.statusCode == 200){
  //     print('Success');
  //   }else {
  //     print(response.statusCode);
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    // senddata();
    if (isBooked) {
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
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              if (index >= 2) {
                return HomeAnnouncement();
              } else if (index == 1) {
                return Container(
                  margin:
                      EdgeInsets.only(left: 60, right: 60, bottom: 35, top: 20),
                  child: FlatButton(
                    height: 50.0,
                    onPressed: () => _roomservice(context),
                    color: Color(0xFF2F2F2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('ROOM SERVICE',
                        style: TextStyle(
                          letterSpacing: 1.0,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        )),
                  ),
                );
              } else {
                return DashboardCard(
                  status: "BOOKED",
                  image: "assets/qrcode.png",
                );
              }
            },
          ),
          endDrawer: DisplayDrawer(
            notificationsCnt: 1,
          ),
          bottomNavigationBar: BottomNavBar(currentIndex: 0),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          resizeToAvoidBottomPadding: false,
          body: DashboardCard(
            status: "NOT BOOKED",
          ),
          endDrawer: DisplayDrawer(
            notificationsCnt: 1,
          ),
          bottomNavigationBar: BottomNavBar(currentIndex: 0),
        ),
      );
    }
  }
}

_roomservice(BuildContext context) async {
  dynamic sessionValue = await FlutterSession().get("first_name");
  print(sessionValue);
  // Navigator.pushNamed(context, '/RoomServiceMain');
}
