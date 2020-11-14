import 'package:flutter/material.dart';
import 'Stars.dart';
import 'HomeCard.dart';

class HotelItem extends StatelessWidget {
  final String image,name,description;
  final int stars;

  HotelItem({@required this.image,@required this.name, @required this.description,@required this.stars});

  @override
  Widget build(BuildContext context) {
    return HomeCard(
      image: image,
      title: name,
      description: description,
      rightWidget: Stars(stars: stars),
    );
    // Column(
    //   children: [
    //     Image.asset(
    //       this.image,
    //       width: 600,
    //       height: 200,
    //       fit: BoxFit.cover,
    //     ),
    //     Container(
    //       child:Column(
    //         children: [
    //           Container(
    //             padding: const EdgeInsets.only(left:32, right:32, top:16, bottom:4),
    //             child: Row(
    //               children: [
    //                 Expanded(
    //                   child: Container(
    //                     child: Text(
    //                       this.name,
    //                       style: TextStyle(
    //                         fontSize: 16,
    //                       )
    //                     ),
    //                   ),
    //                 ),
    //                 Stars(stars: this.stars),
    //               ],
    //             ),
    //           ),
    //           Container(
    //             padding: const EdgeInsets.only(left:32, right:32, top:4, bottom:15),
    //             child: Row(
    //                 children: [
    //                   Text(
    //                     this.description,
    //                     style: TextStyle(
    //                       fontSize: 12,
    //                     )
    //                   )
    //                 ]
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );
  }
}