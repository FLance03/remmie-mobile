import 'package:flutter/material.dart';
import 'screens/screens.dart';

//Screens as String Variables
const Login = '/';
const Home = '/HomePage_Hotel';

void main() => runApp(MaterialApp(
  onGenerateRoute: _routes(), //default routes is '/' which is LoginPage()
  theme: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
));

RouteFactory _routes() {
  return (settings) {
    // final Map<String, dynamic> arguments = settings.arguments;
    Widget screen; //Screen to Load
    switch (settings.name) {
      case Login:
        screen = RoomServicePage2();
        break;
      case Home:
        screen = HomePage_Hotel();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}










