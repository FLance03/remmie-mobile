import 'package:flutter/material.dart';
import 'HotelItem.dart';

class HotelList extends StatelessWidget {
  final List <HotelItem>hotels;

  HotelList({@required this.hotels});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hotels.length,
      itemBuilder: (BuildContext context,int index){
        return hotels[index];
      },
    );
  }
}
