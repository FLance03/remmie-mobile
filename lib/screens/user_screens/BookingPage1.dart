import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class BookingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext outContext) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('remmie',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.black,
                  )),
              bottom: TabBar(
                tabs: <Tab>[
                  Tab(text: 'Details'),
                  Tab(text: 'Payment\n Method'),
                  Tab(text: 'Complete')
                ],
              ),
              centerTitle: true,
            ),
            resizeToAvoidBottomPadding: false,
            body: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomRoomDropDown(
                          width: 300.0,
                          height: 60.0,
                        ),
                        CustomDatePicker(
                            width: 290.0, height: 60.0, label: 'Check-In Date: '),
                        CustomDatePicker(
                            width: 290.0, height: 60.0, label: 'Check-Out Date: '),
                        RaisedButton(
                          onPressed: () => {},
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 40.0),
                            child: Text('Next',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2F2F2F),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text('NGEKNGOK'),
                  ),
                  Container(
                    child: Text('NGEKNGOK'),
                  ),
                ],
              ),
            ),
            endDrawer: DisplayDrawer(
              notificationsCnt: 1,
            ),
          );
        }),
      ),
    );
  }
}
