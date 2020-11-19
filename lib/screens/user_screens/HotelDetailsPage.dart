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
          items:[
            'Logout',
            'Item 1',
            'Item 2',
          ],
          current:'Home',
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
}
