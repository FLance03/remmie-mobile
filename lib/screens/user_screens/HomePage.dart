import 'package:flutter_session/flutter_session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  //create function and place it inside future builder that checksStatus every time page is opened
  checkStatus() async {
    String apiUrl = Api.checkStatus;
    var body = json.encode({"userid": await FlutterSession().get("id")});
    var res = await http.post(apiUrl, body: body);
    var data = jsonDecode(res.body);
    bool flag;
    if (data['msg'] == "SUCCESS") {
      print("USER IS BOOKED");
      flag = true;
    } else {
      print("USER IS NOT BOOKED");
      flag = false;
    }
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        //Keeps rebuilding until the future session variable loads
        future: checkStatus(),
        builder: (context, flag) {
          if (flag.hasData == null) {
            return Container();
          } else {
            if (flag.data == true) {
              return Scaffold(
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
                        margin: EdgeInsets.only(
                            left: 60, right: 60, bottom: 35, top: 20),
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
                endDrawer: DisplayDrawer(),
                bottomNavigationBar: BottomNavBar(currentIndex: 0),
              );
            } else {
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
                  body: DashboardCard(
                    status: "NOT BOOKED",
                  ),
                  endDrawer: DisplayDrawer(),
                  bottomNavigationBar: BottomNavBar(currentIndex: 0),
                ),
              );
            }
          }
        },
      ),
    );
  }
}

_roomservice(BuildContext context) async {
  Navigator.pushNamed(context, '/RoomServiceMain');
}
