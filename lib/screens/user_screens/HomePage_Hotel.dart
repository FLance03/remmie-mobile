import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class HomePage_Hotel extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('TESTTT'),
        ),
        body: HotelList(
          hotels: [
            HotelItem(
              image: 'test_images/hotel2.jpg',
              name: 'Cargotell Travellinn',
              description: 'Entire suite • 2 bedrooms • 1 living room',
              stars: 3,
            ),
            HotelItem(
              image: 'test_images/hotel1.jpg',
              name: 'Sukish',
              description: 'Just suks',
              stars: 2,
            ),
            HotelItem(
              image: 'images/lake.jpg',
              name: 'Lakkeee',
              description: 'Entire suites in the Lake',
              stars: 4,
            ),
          ]
        ),
        endDrawer: DisplayDrawer(
          items:[
            'Home',
            'Item 1',
            'Item 2',
          ],
          current:'Home',),
      ),
    );
  }
}
