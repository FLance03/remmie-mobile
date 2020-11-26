import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class RoomServiceCleaningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Services'),
      ),
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/hotel_bell2.png',
              height: 300,
              width: 300,
              fit: BoxFit.contain,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'Room Service',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: DisplayDrawer(
        notificationsCnt: 1,
      ),
    );
  }
}
