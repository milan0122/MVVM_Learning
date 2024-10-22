import 'package:flutter/material.dart';
import 'package:mvvm_learnig/view_model/services/splash_services.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();
@override
void initState(){

  super.initState();
  splashServices.checkAuthentication(context);
}
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue,Colors.blueGrey,Colors.purpleAccent],
              begin: Alignment.topLeft,
              end:Alignment.bottomRight,
            )
        ),
        child:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.edit,
                size:50,
                color:Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Flutter Learning",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color:Colors.white,
                    fontSize: 32
                ),)
            ],
          ),
        ) ,
      ),
    );
  }
}
