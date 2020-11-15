import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final String status,image;
  final int notificationsCnt;

  DashboardCard({@required this.status,@required this.image,@required this.notificationsCnt});
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
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
                      color: status=='BOOKED' ? Colors.green : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 9,
                  child: Center(
                    child: Text('View Notifications'),
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
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
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
  }
  
}