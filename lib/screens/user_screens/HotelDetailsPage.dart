import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class PreviewImages {
  String image;
}
class HotelDetailsPage extends StatelessWidget {
  final isBooked = false;
  final List<Widget> previewImages = [
    Image.asset(
      'assets/room2.jpg',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/room4.jpg',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/service2.jpg',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/room3.jpg',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/fireworks.jpg',
      width: 130,
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: HotelItem(
                  image: 'assets/holidayhotel.jpg',
                  name: 'Holiday Plaza Hotel',
                  description: 'Superior suite • 2 bedrooms • 1 living room',
                  stars: 3,
                  height: 180.0,
                ),
              ),
              Expanded(
                flex: 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context,index) {
                    return previewImages[index];
                  } 
                ),
              ),
              Container(
                  margin:
                      EdgeInsets.only(bottom: 50, top: 40),
                  child: FlatButton(
                    height: 60.0,
                    onPressed: () => _book(context),
                    color: Color(0xFF2F2F2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('BOOK',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            fontSize: 50.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
            ],
          ),
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1, forcePush: true,),
      ),
    );
  }
}

_book(BuildContext context){
  Navigator.pushNamed(context, '/Booking');
}