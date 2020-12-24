import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class Room {
  String name;
  double price;
  Room({this.name, this.price});
}

class BookingPage extends StatefulWidget {
  final int id;

  const BookingPage({Key key, @required this.id}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage>
    with SingleTickerProviderStateMixin {
  //Utility Variables
  int i, selectedRadioTile, selectedRadio, roomCnt;
  bool flag;

  //Controllers
  TextEditingController _room = TextEditingController(text: 'Superior');
  TextEditingController _datein = TextEditingController(text: 'Pick a Date');
  TextEditingController _dateout = TextEditingController(text: 'Pick a Date');
  TextEditingController _card = TextEditingController(text: 'VISA');

  TextEditingController _name = TextEditingController();
  TextEditingController _cardnumber = TextEditingController();

  TabController _tabController;

  //Page Tabs
  final List<Tab> bookingTabs = <Tab>[
    Tab(text: 'Details'),
    Tab(text: 'Payment Method'),
  ];

  //Room Price Values from Assumed Hotel Database
  var roomnames = [
    'Superior',
    'Business Class',
    'Executive Suite',
    'Holiday Suite',
  ];

  var roomprices = [
    100.0,
    200.0,
    300.0,
    400.0,
  ];

  var room = new Room();
  var roomList = List<Room>();

  @override
  void initState() {
    for (i = 0; i < roomnames.length; i++) {
      room.name = roomnames[i];
      room.price = roomprices[i];
      roomList.add(room);
    }
    selectedRadio = 0;
    selectedRadioTile = 1;
    roomCnt = 1;
    _tabController = TabController(vsync: this, length: 2);
    super.initState();
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
    //Add value to totalPrice based on room type
    setState(() {
      roomCnt++;
    });
  }

  _decrement() {
    //Decrease value from totalPrice based on room type
    setState(() {
      roomCnt--;
    });
  }

  _confirm(BuildContext context) async {
    //pass data process
    // print('hello worldsssss-------------------------------');
    // print(roomCnt);
    // print(_room.text);
    // print(_datein.text);
    // print(_dateout.text);
    // print(_card.text);
    // print(_name.text);
    // print(_cardnumber.text);
    // print(selectedRadioTile);
    // print(widget.id);
    // print('goodbye worldsssss-------------------------------');

    print('Booking...');
    String apiUrl = Api.book;
    var body = json.encode({
      "user_id": await FlutterSession().get("id"),
      "hotel_id": widget.id,
      "room_type": _room.text,
      "room_number": 412,
      "room_floor": 4,
      "room_price": 300.0,
      "payment_option": (selectedRadioTile == 1)? 'card' : 'cash',
      "date_checkin": _datein.text,
      "date_checkout": _dateout.text,
    });
    var res = await http.post(apiUrl, body: body);
    var data = jsonDecode(res.body);

    if (data['msg'] == 'SUCCESS') {
      print('Successfully booked!');
    } else {
      print('Woops! Booking unsuccessful.');
    }

    Navigator.pushNamed(context, '/Complete', arguments: {"date_checkin": _datein.text, "date_checkout": _dateout.text});
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
                          controller: _room,
                        ),
                        CustomDatePicker(
                          width: 290.0,
                          height: 60.0,
                          label: 'Check-In Date: ',
                          controller: _datein,
                        ),
                        CustomDatePicker(
                          width: 290.0,
                          height: 60.0,
                          label: 'Check-Out Date: ',
                          controller: _dateout,
                        ),
                        // Text('Total: Php ' + totalPrice.toString()),
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
                                    controller: _card,
                                  ),
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        IconTextField(
                                            hintText: "Name",
                                            icon: Icons.person,
                                            vertical: 20.0,
                                            controller: _name),
                                        IconTextField(
                                            hintText: "Card Number",
                                            icon: Icons.credit_card,
                                            vertical: 20.0,
                                            controller: _cardnumber),
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
                                    // child: Column(
                                    //   children: <Widget>[
                                    //     CustomCardDropDown(
                                    //       width: 280.0,
                                    //       height: 60.0,
                                    //     ),
                                    //     Container(
                                    //       child: Column(
                                    //         children: <Widget>[
                                    //           IconTextField(
                                    //             hintText: "Name",
                                    //             icon: Icons.person,
                                    //             vertical: 20.0,
                                    //           ),
                                    //           IconTextField(
                                    //             hintText: "Card Number",
                                    //             icon: Icons.credit_card,
                                    //             vertical: 20.0,
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
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
