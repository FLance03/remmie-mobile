import 'package:flutter/material.dart';
import 'screens/screens.dart';

//Screens as String Variables
const Login = '/Login';
const Signup = '/Signup';
const Home = '/Home';
const Hotels = '/Hotels';

const TestRoute = '/';

const HomeLoggedIn = '/HomeLoggedIn';
const HomeLoggedOut = '/HomeLoggedOut';

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
        screen = HomePage_Board();
        break;
      case Login:
        screen = LoginPage();
        break;
      case Signup:
        screen = SignupPage();
        break;
      case HomeLoggedIn:
        screen = HomePage_Board();
        break;
      case Home:
        screen = HomePage();
        break;
      case Hotels:
        screen = HotelsPage();
        break;
      default:
        return null;
    }
    return MaterialPageRoute(builder: (BuildContext context) => screen);
  };
}


