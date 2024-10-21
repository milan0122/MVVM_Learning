import 'package:flutter/material.dart';
import 'package:mvvm_learnig/utility/routes/routes.dart';
import 'package:mvvm_learnig/utility/routes/routes_name.dart';
import 'package:mvvm_learnig/view/home_screen.dart';
import 'package:mvvm_learnig/view/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.deepOrangeAccent
        )
      ),
     initialRoute: RouteName.login,
        onGenerateRoute: Routes.generateRoute
    );
  }
}

