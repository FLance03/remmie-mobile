import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HotelsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: HotelList(
          hotels: [
            HotelItem(
              image: 'assets/hotel2.jpg',
              name: 'Cargotell Travellinn',
              description: 'Entire suite • 2 bedrooms • 1 living room',
              stars: 3,
              onTap: () => _hoteldetails(context),
            ),
            HotelItem(
              image: 'assets/hotel1.jpg',
              name: 'Sukish',
              description: 'Just suks',
              stars: 2,
              onTap: () => _hoteldetails(context),
            ),
            HotelItem(
              image: 'assets/sample.jpg',
              name: 'Lakkeee',
              description: 'Entire suites in the Lake',
              stars: 4,
              onTap: () => _hoteldetails(context),
            ),
          ]
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
}

_hoteldetails(BuildContext context) {
  Navigator.pushNamed(context, '/HotelDetails');
}
