import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  final String notification;

  NotificationTile({@required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      // padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        this.notification,
        style: TextStyle(
          fontSize: 17.0,
          fontWeight: FontWeight.w300,
          color: Color(0xFF2F2F2F),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
