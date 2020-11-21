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
              image: 'test_images/hotel2.jpg',
              name: 'Cargotell Travellinn',
              description: 'Entire suite • 2 bedrooms • 1 living room',
              stars: 3,
            ),
            HotelItem(
              image: 'test_images/hotel1.jpg',
              name: 'Sukish',
              description: 'Just suks',
              stars: 2,
            ),
            HotelItem(
              image: 'images/lake.jpg',
              name: 'Lakkeee',
              description: 'Entire suites in the Lake',
              stars: 4,
            ),
          ]
        ),
        endDrawer: DisplayDrawer(),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
}
