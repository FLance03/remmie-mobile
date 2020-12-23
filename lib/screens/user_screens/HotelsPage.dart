import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';

class Hotels {
  final String imageUrl,name,description;
  final int id,stars;

  Hotels({
    this.id,
    this.imageUrl,
    this.name,
    this.description,
    this.stars,
  });
  factory Hotels.fromJson(Map<String, dynamic> jsonData) {
    return Hotels(
      id: int.parse(jsonData['id']),
      imageUrl: Api.address + Api.imageRoute + jsonData['imageUrl'],
      name: jsonData['name'],
      description: jsonData['description'],
      stars: double.parse(jsonData['stars']).round(),
    );
  }
}
class HotelsPage extends StatefulWidget {
  @override
  _HotelsPageState createState() => _HotelsPageState();
}
class _HotelsPageState extends State<HotelsPage> {
  List<HotelItem> hotels = [];
  int count=0;
  @override
  Widget build(BuildContext context) {
    initializeHotelData(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(),
        body: 
        HotelList(
          hotels:  hotels,
          // [
           
            // HotelItem(
            //   image: 'assets/hotel2.jpg',
            //   name: 'Cargotell Travellinn',
            //   description: 'Entire suite • 2 bedrooms • 1 living room',
            //   stars: 3,
            //   onTap: () => _hoteldetails(context),
            // ),
            // HotelItem(
            //   image: 'assets/hotel1.jpg',
            //   name: 'Sukish',
            //   description: 'Just suks',
            //   stars: 2,
            //   onTap: () => _hoteldetails(context),
            // ),
            // HotelItem(
            //   image: 'assets/sample.jpg',
            //   name: 'Lakkeee',
            //   description: 'Entire suites in the Lake',
            //   stars: 4,
            //   onTap: () => _hoteldetails(context),
            // ),
          // ]
        ),
        endDrawer: DisplayDrawer(
          notificationsCnt: 1,
        ),
        bottomNavigationBar: BottomNavBar(currentIndex: 1),
      ),
    );
  }
  void initializeHotelData(context) async {
    List<Hotels> getHotels;

    if (count == 0){
      getHotels = await getHotelData();
      if (getHotels != null){
        for (int i=0 ; i<getHotels.length ; i++){
          setState(() {
            hotels.add(
              HotelItem(
                image: getHotels[i].imageUrl,
                name: getHotels[i].name,
                description: getHotels[i].description,
                stars: getHotels[i].stars,
                onTap: () => _hoteldetails(context,getHotels[i].id),
              )
            );
          });
        }
      }
      setState(() {
       count++;
      });
    }
  }
}

Future<List<Hotels>> getHotelData() async{
  final String apiUrl = Api.hotelpage;

  final response = await http.get(apiUrl);
  
  if (response.statusCode == 200) {
    List hotelData = json.decode(response.body);

    if (hotelData[0]['success'] == 0){
      return null;
    }else {
      return hotelData
          .map((hotel) => new Hotels.fromJson(hotel))
          .toList();
    }
  } else{
    print("We were not able to successfully download the json data.");
  }
  return null;
}
_hoteldetails(BuildContext context,int id) {
  Navigator.pushNamed(context, '/HotelDetails',arguments:{"id":id});
}
