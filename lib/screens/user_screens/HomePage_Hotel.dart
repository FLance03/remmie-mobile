import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HomePage_Hotel extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TESTTT'),
      ),
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
            image: 'assets/fries.PNG',
            name: 'Lakkeee',
            description: 'Entire suites in the Lake',
            stars: 4,
          ),
        ]
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
      endDrawer: DisplayDrawer(
        items:[
          'Home',
          'Item 1',
          'Item 2',
        ],
        current:'Home',),
    );
  }
}
