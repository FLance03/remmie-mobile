import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/widgets.dart';

class Announcements {
  String imageUrl, description;

  Announcements({
    this.imageUrl,
    this.description,
  });
}

class AnnouncementDetailsPage extends StatefulWidget {
  final int id;

  AnnouncementDetailsPage({@required this.id});
  @override
  _AnnouncementDetailsPageState createState() =>
      _AnnouncementDetailsPageState();
}

class _AnnouncementDetailsPageState extends State<AnnouncementDetailsPage> {
  Announcements data;

  void getAnnouncementData() async {
    final queryParameters = {
      'id': widget.id.toString(),
    };

    final uri = Uri.http('192.168.0.59', '/flutter/remmie/php/announcement.php',
        queryParameters);
    final response = await http.get(uri);

    data = new Announcements();
    if (response.statusCode == 200) {
      var announcementData = json.decode(response.body);

      if (announcementData['success'] == 0) {
        setState(() {
          this.data = null;
        });
      } else {
        setState(() {
          this.data.imageUrl = announcementData['imageUrl'];
          this.data.description = announcementData['description'];
        });
      }
    } else {
      print("We were not able to successfully download the json data.");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      getAnnouncementData();
    }
    return data == null
        ? AnnouncementDetailsPageStateless()
        : AnnouncementDetailsPageStateless(
            imageUrl: data.imageUrl,
            description: data.description,
          );
  }
}
