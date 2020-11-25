import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class RoomServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Services'),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border(
            top: BorderSide(color: Colors.black),
          ),
        ),
        child: Column(
          children:[
            Expanded(
              flex:5,
              child: Stack (
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/FoodDrinks');
                    },
                    child: Image.asset(
                      'assets/grilled_burger.PNG',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/FoodDrinks');
                    },
                    child: Center(
                      child: Text(
                        'Food & Drinks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ) 
            ),
            Expanded(
              flex:5,
              child: Stack (
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/RoomCleaning');
                    },
                    child: Image.asset(
                      'assets/grilled_burger.PNG',
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context,'/RoomCleaning');
                    },
                    child: Center(
                      child: Text(
                        'Room Cleaning',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ],
              ) 
            ),
          ],
        ),
      ),
      endDrawer: DisplayDrawer(
        items:[
          'Home',
          'Item 1',
          'Item 2',
        ],
        current:'Home',
      ),
    );
  }
}
