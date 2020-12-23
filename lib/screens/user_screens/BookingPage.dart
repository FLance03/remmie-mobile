import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key key}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {
  int selectedRadioTile, selectedRadio, roomCnt;
  double totalPrice;
  bool flag;

  final List<Tab> bookingTabs = <Tab>[
    Tab(text: 'Details'),
    Tab(text: 'Payment Method'),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 1;
    roomCnt = 1;
    totalPrice = 0.0;
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _next() {
    _tabController.animateTo((_tabController.index + 1));
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  _increment() {
    setState(() {
      roomCnt++;
    });
  }

  _decrement() {
    if (roomCnt > 1) {
      setState(() {
        roomCnt--;
      });
    }
  }

  @override
  Widget build(BuildContext outContext) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('remmie',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.black,
                  )),
              bottom: TabBar(
                controller: _tabController,
                tabs: bookingTabs,
              ),
              centerTitle: true,
            ),
            resizeToAvoidBottomPadding: false,
            body: Container(
              padding: EdgeInsets.only(bottom: 20.0),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //Start of Details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Number of Rooms: ',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2F2F2F),
                                )),
                            Center(
                              child: Text(roomCnt.toString(),
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2F2F2F),
                                  )),
                            ),
                            ButtonTheme(
                              minWidth: 50.0,
                              child: RaisedButton(
                                onPressed: () => _decrement(),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text('-',
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2F2F2F),
                                    )),
                              ),
                            ),
                            ButtonTheme(
                              minWidth: 50.0,
                              child: RaisedButton(
                                onPressed: () => _increment(),
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text('+',
                                    style: TextStyle(
                                      letterSpacing: 1.0,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2F2F2F),
                                    )),
                              ),
                            ),
                          ],
                        ),
                        CustomRoomDropDown(
                          width: 290.0,
                          height: 60.0,
                        ),
                        CustomDatePicker(
                            width: 290.0,
                            height: 60.0,
                            label: 'Check-In Date: '),
                        CustomDatePicker(
                            width: 290.0,
                            height: 60.0,
                            label: 'Check-Out Date: '),
                        Text('Total: Php ' + totalPrice.toString()),
                        RaisedButton(
                          onPressed: () => _next(),
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
                  //End of Details

                  //Start of Payment Method
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RadioListTile(
                          value: 1,
                          groupValue: selectedRadioTile,
                          title: Text("Credit Card"),
                          // subtitle: Text("Radio 1 Subtitle"),
                          onChanged: (val) {
                            if (val == 1) {
                              print('$val');
                            }
                            setSelectedRadioTile(val);
                          },
                          activeColor: Color(0xFF2F2F2F),
                          // secondary: OutlineButton(
                          //   child: Text("Say Hi"),
                          //   onPressed: () {
                          //     print("Say Hello");
                          //   },
                          // ),
                          selected: true,
                        ),
                        (() {
                          if (this.selectedRadioTile == 1) {
                            return Container(
                              child: Column(
                                children: <Widget>[
                                  CustomCardDropDown(
                                    width: 280.0,
                                    height: 60.0,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        IconTextField(
                                          hintText: "Name",
                                          icon: Icons.person,
                                          vertical: 20.0,
                                        ),
                                        IconTextField(
                                          hintText: "Card Number",
                                          icon: Icons.credit_card,
                                          vertical: 20.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return AbsorbPointer(
                              absorbing: true,
                              child: Opacity(
                                opacity: 0.60,
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      CustomCardDropDown(
                                        width: 280.0,
                                        height: 60.0,
                                      ),
                                      Container(
                                        child: Column(
                                          children: <Widget>[
                                            IconTextField(
                                              hintText: "Name",
                                              icon: Icons.person,
                                              vertical: 20.0,
                                            ),
                                            IconTextField(
                                              hintText: "Card Number",
                                              icon: Icons.credit_card,
                                              vertical: 20.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }()),
                        RadioListTile(
                          value: 2,
                          groupValue: selectedRadioTile,
                          title: Text("Cash on Arrival"),
                          onChanged: (val) {
                            setSelectedRadioTile(val);
                          },
                          activeColor: Color(0xFF2F2F2F),
                          selected: false,
                        ),
                        RaisedButton(
                          onPressed: () => _confirm(context),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            child: Text('Confirm Booking',
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
                  //End of Payment Method
                ],
              ),
            ),
            endDrawer: DisplayDrawer(),
          );
        }),
      ),
    );
  }
}

_confirm(BuildContext context) {
  Navigator.pushNamed(context, '/Complete');
}
