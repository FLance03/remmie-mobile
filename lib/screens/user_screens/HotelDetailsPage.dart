import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HotelDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Container(
            
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
}
