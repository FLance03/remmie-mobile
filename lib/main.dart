import 'package:flutter/material.dart';
import 'screens/screens.dart';

//Screens as String Variables
const TestRoute = '/';
const Login = '/Login';
const Signup = '/Signup';
const Home = '/Home';
const Hotels = '/Hotels';
const Booking = '/Booking';
const RoomServiceMain = '/RoomServiceMain';
const RoomServiceProducts = '/RoomServiceProducts';
const RoomServiceCleaning = '/RoomServiceCleaning';

void main() => runApp(MaterialApp(
      onGenerateRoute: _routes(), //default routes is '/' which is LoginPage()
      theme: _theme(),
    ));

ThemeData _theme() {
  return ThemeData(
    primaryColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

RouteFactory _routes() {
  return (settings) {
    // final Map<String, dynamic> arguments = settings.arguments; //Needed for passing data between screens
    Widget screen;
    switch (settings.name) {
      case TestRoute:
        screen = RoomServiceProductsPage();
        break;
      case Login:
        screen = LoginPage();
        break;
      case Signup:
        screen = SignupPage();
        break;
      case Home:
        screen = HomePage();
        break;
      case Hotels:
        screen = HotelsPage();
        break;
      case Booking:
        screen = BookingPage();
        break;
      case RoomServiceMain:
        screen = RoomServiceMainPage();
        break;
      case RoomServiceProducts:
        screen = RoomServiceProductsPage();
        break;
      case RoomServiceCleaning:
        screen = RoomServiceCleaningPage();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
