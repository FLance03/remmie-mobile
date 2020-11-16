import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

final isBooked = true;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (isBooked) {
      return SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(),
          resizeToAvoidBottomPadding: false,
          body: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              if (index >= 2) {
                return HomeAnnouncement();
              } else if (index == 1) {
                return Container(
                  margin: EdgeInsets.only(
                    left: 60,
                    right: 60,
                    bottom: 30,
                  ),
                  child: ElevatedButton(
                    child: Text("ROOM SERVICE",
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    onPressed: () {},
                  ),
                );
              } else {
                return DashboardCard(
                  status: "BOOKED",
                  notificationsCnt: 1,
                  image: "assets/qrcode.png",
                );
              }
            },
          ),
          bottomNavigationBar: BottomNavBar(currentIndex: 0),
          endDrawer: DisplayDrawer(
            items: [
              'Home',
              'Item 1',
              'Item 2',
            ],
            current: 'Home',
          ),
        ),
      );
    } else {
      return Scaffold(resizeToAvoidBottomPadding: false, body: Container());
    }
  }
}
