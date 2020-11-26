import 'package:flutter/material.dart';
import 'screens/screens.dart';

//Screens as String Variables
const TestRoute = '/';
const Login = '/Login';
const Signup = '/Signup';
const Home = '/Home';
const Hotels = '/Hotels';
const Booking = '/Booking';
const FoodDrinks = '/FoodDrinks';
const RoomCleaning = '/RoomCleaning';

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
<<<<<<< HEAD
        screen = AnnouncementDetailsPage();
=======
        screen = LoginPage();
>>>>>>> aefd90906017af805b16034893f6a8b29bab6a2d
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
      case FoodDrinks:
        screen = RoomServicePage2();
        break;
      case RoomCleaning:
        screen = RoomServicePage3();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}
