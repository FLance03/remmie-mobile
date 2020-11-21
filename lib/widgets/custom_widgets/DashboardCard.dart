import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String status, image;
  final int notificationsCnt;

  DashboardCard({@required this.status, this.image, this.notificationsCnt});
  Widget build(BuildContext context) {
    print(this.status);
    if (this.status == "BOOKED") {
      
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Text('STATUS'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF2F2F2F),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Text(
                          'View Notifications',
                          style: TextStyle(
                              fontSize: 15.0,
                              letterSpacing: 1.0,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(notificationsCnt.toString()),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
              child: Image.asset(
                image,
                width: 300,
                height: 300,
                fit: BoxFit.fitWidth,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Text('STATUS'),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      status,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 45.0,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xFF2F2F2F),
              ),
            ),
            Container(
              height: 250.0,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)),
              ),
            ),
          ],
        ),
      );
    }
  }
}
