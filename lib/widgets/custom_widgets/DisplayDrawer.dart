import 'package:flutter/material.dart';

class DisplayDrawer extends StatelessWidget {
  final int notificationsCnt;
  DisplayDrawer({@required this.notificationsCnt});

  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text('Profile'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: Container(
            child: Row(
              children: <Widget>[
                Text("Notifications"),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        notificationsCnt.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            // Navigator.pop(context);
          },
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
