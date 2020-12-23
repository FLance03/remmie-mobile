import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';


class AnnouncementDetailsPageStateless extends StatelessWidget {
  final String imageUrl, description;

  AnnouncementDetailsPageStateless({this.imageUrl,this.description});

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
      Scaffold(
        appBar: CustomAppBar(),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  child: imageUrl==null ? null : Image.network(
                    Api.address + Api.imageRoute + imageUrl,
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                  // child: Image.asset(
                  //   'assets/grilled_burger.PNG',
                  //   height: 300,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.fill,
                  // ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                    bottom: 30,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 0.8,
                      ),
                    ],
                  ),
                  child: description==null ? Text('') : Text(
                    description,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ],
        ),
        endDrawer: DisplayDrawer(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 0,
          forcePush: true,
        ),
      ),
    );
  }
}
