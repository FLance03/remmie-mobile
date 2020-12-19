import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String status, image;

  DashboardCard({@required this.status, this.image});
  Widget build(BuildContext context) {
    if (this.status == "BOOKED") {
      return Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(
          top: 30,
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
                  Text('STATUS'),
                  Expanded(
                    child: Text(
                    status,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
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
          top: 0,
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
                  Text('STATUS'),
                  Expanded(
                    child: Text(
                    status,
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
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
