import 'package:flutter/material.dart';

class DisplayDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text('Logout'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('SAMPLE BUTTON 2'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text('SAMPLE BUTTON 3'),
          onTap: () {
            // Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
