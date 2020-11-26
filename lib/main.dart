import 'package:flutter/material.dart';
import 'screens/screens.dart';

//Screens as String Variables
const TestRoute = '/';
const Login = '/';
const Signup = '/Signup';
const Home = '/Home';
const Hotels = '/Hotels';
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
        screen = AnnouncementDetailsPage();
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


