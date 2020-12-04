import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class PreviewImages {
  String image;
}
class HotelDetailsPage extends StatelessWidget {
  final isBooked = false;
  final List<Widget> previewImages = [
    Image.asset(
      'assets/grilled_burger.PNG',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/grilled_burger.PNG',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/grilled_burger.PNG',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/grilled_burger.PNG',
      width: 130,
      fit: BoxFit.fill,
    ),
    Image.asset(
      'assets/grilled_burger.PNG',
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
                  image: 'assets/hotel2.jpg',
                  name: 'Cargotell Travellinn',
                  description: 'Entire suite • 2 bedrooms • 1 living room',
                  stars: 3,
                  height: 150.0,
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
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: ButtonTheme(
                    minWidth: 200.0,
                    child: FlatButton(
                      height: 30.0,
                      onPressed: () => {_booking(context)},
                      color: isBooked ? Color(0x882F2F2F) : Color(0xFF2F2F2F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text('BOOK',
                        style: TextStyle(
                          letterSpacing: 5.0,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1,forcePush: true,),
      ),
    );
  }
}
_booking (BuildContext context){
  Navigator.pushNamed(context, '/Booking');
}