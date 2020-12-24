import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import '../../api.dart';
import '../../widgets/widgets.dart';
import 'dart:convert';

// class DisplayDrawer extends StatelessWidget {
//   final int notificationsCnt;
//   DisplayDrawer({@required this.notificationsCnt});

//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Column(
//       children: <Widget>[
//         ExpansionTile(
//           title: Text('Profile'),
//           children: <Widget>[
//             Text('Fletcher Chua'),
//             Text('flance@gmail.com'),
//           ],
//         ),
//         ExpansionTile(
//           title: Text("Notifications"),
//           trailing: Text('5'),
//           children: <Widget>[
//             Text('Notif 1'),
//             Text('Notif 2'),
//             Text('Notif 3'),
//             Text('Notif 4'),
//             Text('Notif 5'),
//           ],
//         ),
//         ListTile(
//             title: Text('Logout'),
//             onTap: () {
//               //Logout condition
//               Navigator.pushReplacementNamed(context, '/');

//             }),
//       ],
//     ));
//   }
// }

class DisplayDrawer extends StatefulWidget {
  @override
  _DisplayDrawerState createState() => _DisplayDrawerState();
}

class _DisplayDrawerState extends State<DisplayDrawer> {
  List<String> notifs = <String>[];
  int notifCount;

  @override
  void initState() {
    _getNotifCount();
    print('--------------------------------===');
    print(notifs);
    super.initState();
  }

  _getNotifCount() async {
    String apiUrl = Api.getNotifCount;
    var body = json.encode({"userid": await FlutterSession().get("id")});
    var res = await http.post(apiUrl, body: body);
    var data = jsonDecode(res.body);
    if (data['msg'] == "SUCCESS") {
      for (int i = 0; i < data['notifCount']; i++) {
        setState(() {
          notifs.add(data['notifs'][i]['message']);
        });
      }
      // print(notifs);
      // print('------------notifss^------------------');
      // print(notifs[1]);
      // print(notifs[2]);
      // print(notifs[3]);
      // print(notifs[4]);

      setState(() {
        notifCount = data['notifCount'];
      });
      // print(notifs);
      // print(notifCount);
      // print('-------------notifs^-------------------');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: DrawerHeader(
                child: Text(''),
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: Color(0xFF2f2f2f),
                ),
              ),
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Profile'),
          children: <Widget>[
            FutureBuilder(
              future: FlutterSession().get("firstname"),
              builder: (context, fname) {
                if(fname.hasData == null){
                  return Container();
                } else {
                  return FutureBuilder(
                    future: FlutterSession().get("lastname"),
                    builder: (context, lname) {
                      if(lname.hasData == null){
                        return Container();
                      } else {
                        return NotificationTile(
                          notification: fname.data + ' ' + lname.data,
                        );
                      }
                    }
                  );
                }
              }
            ),
            FutureBuilder(
              future: FlutterSession().get("email"),
              builder: (context, email) {
                if(email.hasData == null){
                  return Container();
                } else {
                  return NotificationTile(
                    notification: email.data,
                  );
                }
              }
            ),
          ],
        ),
        ExpansionTile(
          title: Text('Notifications'),
          trailing: Text(notifCount.toString()),
          children: <Widget>[
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: notifCount,
              itemBuilder: (BuildContext context, int index) {
                return NotificationTile(
                  notification: notifs[index],
                );
              },
            ),
          ],
        ),
        ListTile(
            title: Text('Logout'),
            onTap: () {
              //Logout condition
              Navigator.pushReplacementNamed(context, '/');
            }),
      ],
    ));
  }
}
