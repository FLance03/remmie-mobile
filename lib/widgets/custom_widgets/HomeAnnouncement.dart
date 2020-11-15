import 'package:flutter/material.dart';
import 'HomeCard.dart';
import 'DisplayDrawer.dart';

class HomeAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeCard(
      image: 'assets/fireworks.jpg',
      title: 'Cargotell Travellinn',
      description: 'October 26, 2020',
      subDescription: '9:00 PM - 9:10 PM',
    );
  }
}
