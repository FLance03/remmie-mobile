import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class RoomServiceMainPage extends StatelessWidget {
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
          children: [
            Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/RoomServiceProducts');
                        },
                        child: Image.asset(
                          'assets/service1.jpg',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/RoomServiceProducts');
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
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/RoomServiceCleaning');
                      },
                      child: Image.asset(
                        'assets/service3.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/RoomServiceCleaning');
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      endDrawer: DisplayDrawer(),
    );
  }
}
