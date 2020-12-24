import 'package:Remmie/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../api.dart';
import '../../widgets/widgets.dart';


class RoomServiceCleaningPage extends StatelessWidget {
  void requestCleaning() async{
    await FlutterSession().set("id",1);
    await FlutterSession().set("reservation_id",1);
    final apiUrl = Api.roomcleaning;
    final userId = await FlutterSession().get("id");
    final reservationId = await FlutterSession().get("id");
    final body = json.encode({
      "user_id": userId,
      "reservation_id": reservationId,
    });
    print("aa");
    final res = await http.post(apiUrl, body: body);
    var data = jsonDecode(res.body);
    if (res.statusCode != 200){
      print("Error: "+res.statusCode.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Room Services'),
      ),
      body: Stack(
        children: [
          Center(
            child: GestureDetector(
              onTap: () {
                requestCleaning();
              },
              child: Image.network(
                Api.address + Api.imageRoute + 'hotel_bell2.png',
                height: 300,
                width: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'Room Service',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      endDrawer: DisplayDrawer(),
    );
  }
}
