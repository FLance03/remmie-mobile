import 'package:flutter/material.dart';
import 'screens/screens.dart';

//Screens as String Variables
const TestRoute = '/';
// const Login = '/Login';
const Login = '/';
const Signup = '/Signup';
const Home = '/Home';
const Hotels = '/Hotels';
const Booking = '/Booking';
const Complete = '/Complete';
const RoomServiceMain = '/RoomServiceMain';
const RoomServiceProducts = '/RoomServiceProducts';
const RoomServiceCleaning = '/RoomServiceCleaning';
const AnnouncementDetails = '/AnnouncementDetails';
const HotelDetails = '/HotelDetails';

Future main() async{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    onGenerateRoute: _routes(), //default routes is '/' which is LoginPage()
    theme: _theme(),
  ));
}

ThemeData _theme() {
  return ThemeData(
    primaryColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

RouteFactory _routes() {
  return (settings) {
    final Map<String, dynamic> arguments = settings.arguments; //Needed for passing data between screens
    Widget screen;
    switch (settings.name) {
      case TestRoute:
        screen = RoomServiceCleaningPage();
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
      case Complete:
        screen = CompletePage();
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
      case AnnouncementDetails:
        screen = AnnouncementDetailsPage();
        break;
      case HotelDetails:
        screen = HotelDetailsPage(id: arguments['id']);
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
