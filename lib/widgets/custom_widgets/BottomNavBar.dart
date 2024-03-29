import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final bool forcePush;

  BottomNavBar({@required this.currentIndex,this.forcePush});
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.hotel),
          label: 'HOTELS',
        )
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      onTap: (int index){
        // if (index!=currentIndex || forcePush){
          if (index == 1){
            Navigator.pushReplacementNamed(context, '/Hotels');
          }else {
            Navigator.pushReplacementNamed(context, '/Home'); 
          }
        // }
      },
    );
  }
}