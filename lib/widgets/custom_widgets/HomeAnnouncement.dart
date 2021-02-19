import 'package:flutter_session/flutter_session.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import 'HomeCard.dart';

class AnnouncementsList {
  int id;
  String imageUrl, title;

  AnnouncementsList({
    this.id,
    this.title,
    this.imageUrl,
  });
  factory AnnouncementsList.fromJson(Map<String, dynamic> jsonData) {
    return AnnouncementsList(
      id: int.parse(jsonData['id']),
      title: jsonData['title'],
      imageUrl: Api.address + Api.imageRoute + jsonData['imageUrl'],
    );
  }
}

class HomeAnnouncement extends StatelessWidget {
  Future<List<Widget>> getAnnouncements(BuildContext context) async {
    // final apiUrl = Api.announcementlist;
    final hotelId = await FlutterSession().get("hotel_id");
    final queryParameters = {
      'hotel_id': hotelId.toString(),
    };
    Uri uri = Uri.http(Api.ipaddress,
        '/flutter/remmie/php/announcementlist.php', queryParameters);
    final response = await http.get(uri);
    List<Widget> retVal = [];

    if (response.statusCode == 200) {
      List announcementlistdata = json.decode(response.body);
      List<AnnouncementsList> announcementlist = [];

      announcementlist = announcementlistdata
          .map((announcement) => new AnnouncementsList.fromJson(announcement))
          .toList();
      for (int i = 0; i < announcementlist.length; i++) {
        retVal.add(HomeCard(
          image: announcementlist[i].imageUrl,
          title: announcementlist[i].title,
          onTap: () => _announcementdetails(context, announcementlist[i].id),
        ));
      }
    }
    return retVal;
  }

  @override
  Widget build(BuildContext context) {
    print("sfsdfds");
    return FutureBuilder(
        future: getAnnouncements(context),
        builder: (context, announcement) {
          List<Widget> children;
          if (announcement.hasData) {
            children = announcement.data;
          } else if (announcement.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${announcement.error}'),
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
                child: Text('Retrieving announcements data...'),
              )
            ];
          }
          return Column(
            children: children,
          );
        }
        // HomeCard(
        //   image: 'assets/fireworks.jpg',
        //   title: 'Sinugba With Us Tonight',
        //   description: 'October 26, 2020',
        //   subDescription: '9:00 PM - 12:00 AM',
        //   onTap:() => _announcementdetails(context),
        // );
        );
  }
}

_announcementdetails(BuildContext context, int id) {
  Navigator.pushNamed(context, '/AnnouncementDetails', arguments: {"id": id});
}
