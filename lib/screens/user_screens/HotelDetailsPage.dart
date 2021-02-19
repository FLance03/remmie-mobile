import 'package:Remmie/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class HotelDetails {
  String imageUrl;

  HotelDetails({this.imageUrl});
  factory HotelDetails.fromJson(Map<String, dynamic> jsonData) {
    return HotelDetails(
      imageUrl: Api.address + Api.imageRoute + jsonData['imageUrl'],
    );
  }
}

class PreviewImages {
  String image;
}

class HotelDetailsPage extends StatefulWidget {
  final int id;

  HotelDetailsPage({@required this.id});
  @override
  _HotelDetailsPageState createState() => _HotelDetailsPageState();
}

class _HotelDetailsPageState extends State<HotelDetailsPage> {
  int count = 0;
  bool isBooked = false;
  HotelItem hotelItem;
  List<Widget> previewImages = [
    // Image.asset(
    //   'assets/room2.jpg',
    //   width: 130,
    //   fit: BoxFit.fill,
    // ),
    // Image.asset(
    //   'assets/room4.jpg',
    //   width: 130,
    //   fit: BoxFit.fill,
    // ),
    // Image.asset(
    //   'assets/service2.jpg',
    //   width: 130,
    //   fit: BoxFit.fill,
    // ),
    // Image.asset(
    //   'assets/room3.jpg',
    //   width: 130,
    //   fit: BoxFit.fill,
    // ),
    // Image.asset(
    //   'assets/fireworks.jpg',
    //   width: 130,
    //   fit: BoxFit.fill,
    // ),
  ];

  void getHotelDetailsData() async {
    final queryParameters = {
      'id': widget.id.toString(),
    };

    Uri uri = Uri.http(
        Api.ipaddress, '/flutter/remmie/php/hoteldetail.php', queryParameters);
    final detailResponse = await http.get(uri);
    uri = Uri.http(
        Api.ipaddress, '/flutter/remmie/php/hotel.php', queryParameters);
    final hotelResponse = await http.get(uri);

    if (detailResponse.statusCode == 200 && hotelResponse.statusCode == 200) {
      List hotelDetailsData = json.decode(detailResponse.body);
      List<HotelDetails> hotelDetails;
      List hotelData = json.decode(hotelResponse.body);
      List<Hotels> hotels;

      print(hotelDetailsData);
      if (hotelDetailsData[0]['size'] != 0) {
        hotelDetails = hotelDetailsData
            .map((detail) => new HotelDetails.fromJson(detail))
            .toList();
        for (int i = 0; i < hotelDetails.length; i++) {
          setState(() {
            previewImages.add(
              Image.network(
                hotelDetails[i].imageUrl,
                width: 130,
                fit: BoxFit.fill,
              ),
            );
          });
        }
      }
      if (hotelData[0]['success'] != 0) {
        hotels = hotelData.map((hotel) => new Hotels.fromJson(hotel)).toList();
        setState(() {
          hotelItem = HotelItem(
            image: hotels[0].imageUrl,
            name: hotels[0].name,
            description: hotels[0].description,
            stars: hotels[0].stars,
            height: 120.0,
          );
        });
      }
    } else {
      print("We were not able to successfully download the json data.");
    }
  }

  Future<bool> getBookingInformation() async {
    await FlutterSession().set("id", 1);
    final userId = await FlutterSession().get("id");
    final String apiUrl = Api.checkStatus;
    final body = json.encode({
      'userid': userId.toString(),
    });
    print(apiUrl + body);
    final response = await http.post(apiUrl, body: body);
    bool retVal = true;

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (data['reservation_id'] == null) {
        retVal = false;
      }
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      setState(() {
        count++;
      });
      getHotelDetailsData();
    }
    getBookingInformation();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: hotelItem == null ? SizedBox() : hotelItem,
              ),
              Expanded(
                flex: 3,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: previewImages.length,
                    itemBuilder: (context, index) {
                      return previewImages[index];
                    }),
              ),
              FutureBuilder(
                  future: getBookingInformation(),
                  builder: (context, isBooked) {
                    List<Widget> children;
                    if (isBooked.hasData) {
                      children = [
                        Container(
                          margin: EdgeInsets.only(bottom: 10, top: 10),
                          child: FlatButton(
                            onPressed: () => isBooked.data == true
                                ? null
                                : _book(context, widget.id),
                            color: isBooked.data == true
                                ? Color(0x802F2F2F)
                                : Color(0xFF2F2F2F),
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
                        ),
                      ];
                    } else if (isBooked.hasError) {
                      children = <Widget>[
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${isBooked.error}'),
                        )
                      ];
                    } else {
                      children = <Widget>[
                        SizedBox(
                          child: CircularProgressIndicator(),
                          width: 60,
                          height: 60,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Checking Booking Information...'),
                        )
                      ];
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: children,
                      ),
                    );
                  }),
              // Container(
              //     margin: EdgeInsets.only(bottom: 10, top: 10),
              //     child: flag==0 ? SizedBox() : FlatButton(
              //       onPressed: () => _book(context),
              //       color: Color(0xFF2F2F2F),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       child: Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: Text('BOOK',
              //             style: TextStyle(
              //               letterSpacing: 1.0,
              //               fontSize: 50.0,
              //               fontWeight: FontWeight.w400,
              //               color: Colors.white,
              //             )),
              //       ),
              //     ),
              //   )
            ],
          ),
        ),
        endDrawer: DisplayDrawer(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 1,
          forcePush: true,
        ),
      ),
    );
  }
}

_book(BuildContext context, int id) {
  Navigator.pushNamed(context, '/Booking', arguments: {"id": id});
}
