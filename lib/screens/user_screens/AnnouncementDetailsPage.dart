import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class AnnouncementDetailsPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: ListView(
            children: [
              Container(
                child: Image.asset(
                  'assets/grilled_burger.PNG',
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 5.0,
                ),
                child: Text(
                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut est justo. Curabitur fringilla vitae neque in scelerisque. Cras a lorem vel urna fringilla placerat. Mauris pretium sollicitudin metus a cursus. Curabitur elementum magna at dictum ultricies. Aenean posuere vehicula consequat. Proin rhoncus efficitur pretium.',

                ),
              ),
            ],
          ),
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
}
