import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class AnnouncementDetailsPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/grilled_burger.PNG',
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                    bottom: 30,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 0.8,
                      ),
                    ],
                  ),
                  child: Text(
                    '     Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut est justo. Curabitur fringilla vitae neque in scelerisque. Cras a lorem vel urna fringilla placerat.\n Mauris pretium sollicitudin metus a cursus. Curabitur elementum magna at dictum ultricies. Aenean posuere vehicula consequat. Proin rhoncus efficitur pretium.',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
          forcePush: true,
        ),
      ),
    );
  }
}
