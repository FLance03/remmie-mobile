import 'package:flutter/material.dart';
import 'HomeCard.dart';

class HomeAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomeCard(
      image: 'assets/fireworks.jpg',
      title: 'Sinugba With Us Tonight',
      description: 'October 26, 2020',
      subDescription: '9:00 PM - 12:00 AM',
      onTap:() => _announcementdetails(context),
    );
  }
}

_announcementdetails(BuildContext context) {
  Navigator.pushNamed(context, '/AnnouncementDetails');
}
