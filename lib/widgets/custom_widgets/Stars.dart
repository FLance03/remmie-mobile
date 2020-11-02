import 'package:flutter/material.dart';

class Stars extends StatelessWidget{
  final stars;

  Stars({@required this.stars});

  @override
  Widget build(BuildContext context){
    return Container(
      child: generateStars(),
    );
    // return Text(
    //     '${stars}',
    //     style: TextStyle(
    //       fontSize: 16,
    //     )
    // );
  }
  generateStars(){
    final buildStars = <Widget>[];
    var i;

    for (i=0 ; i<this.stars ; i++){
      buildStars.add(
        new Icon(
          Icons.star,
          color: Colors.amber,
          size: 15.0,
        ),
      );
    }
    for ( ; i<5 ; i++){
      buildStars.add(
        new Icon(
          Icons.star_border,
          color: Colors.amber,
          size: 15.0,
        ),
      );
    }
    return Row(
      children: buildStars,
    );
  }
}