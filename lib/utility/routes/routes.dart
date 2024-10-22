import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_learnig/utility/routes/routes_name.dart';
import 'package:mvvm_learnig/view/home_screen.dart';
import 'package:mvvm_learnig/view/login_screen.dart';
import 'package:mvvm_learnig/view/signup.dart';
import 'package:mvvm_learnig/view/splash_screen.dart';
class Routes{

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (_)=>HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (_)=>LoginScreen());
      case RouteName.signUP:
        return MaterialPageRoute(builder: (_)=>SignUpScreen());
      case RouteName.splash:
        return MaterialPageRoute(builder: (_)=>SplashScreen());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child: Text('404 page Error !!!'),
            ),
          );
        });

    }
  }

}