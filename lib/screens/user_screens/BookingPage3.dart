import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class BookingPage3 extends StatelessWidget {
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
          bottom: TabBar(
            tabs: <Tab>[Tab(text: 'Foods'), Tab(text: 'Beverages')],
          ),
          centerTitle: true,
          // backgroundColor: Colors.red[600],
        ),
        resizeToAvoidBottomPadding: false,
        body: Container(),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
      ),
    );
  }
}
