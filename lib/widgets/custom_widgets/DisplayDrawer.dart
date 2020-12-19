import 'package:flutter/material.dart';

class DisplayDrawer extends StatelessWidget {
  final int notificationsCnt;
  DisplayDrawer({@required this.notificationsCnt});

  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        ExpansionTile(
          title: Text('Profile'),
          children: <Widget>[
            Text('Fletcher Chua'),
            Text('flance@gmail.com'),
          ],
        ),
        ExpansionTile(
          title: Text("Notifications"),
          trailing: Text('5'),
          children: <Widget>[
            Text('Notif 1'),
            Text('Notif 2'),
            Text('Notif 3'),
            Text('Notif 4'),
            Text('Notif 5'),
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
