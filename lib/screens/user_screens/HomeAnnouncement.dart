import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HomeAnnouncement extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TESTTT'),
      ),
      body: HomeCard(
          image: 'test_images/hotel2.jpg',
          title: 'Cargotell Travellinn',
          description: 'October 26, 2020',
          subDescription: '9:00 PM - 9:10 PM',
      ),
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
