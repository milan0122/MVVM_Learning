import 'package:flutter/material.dart';
import 'package:mvvm_learnig/utility/utils.dart';

import '../utility/routes/routes_name.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MVVM Learning'),
          centerTitle: true,
        ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: (){
               // Utils.toastMessage('No internet connection');

                 Utils.flushBarErrorMessage(
                    'No Internet Connection',context);
                //Navigator.pushNamed(context, RouteName.home);

                //Utils.snakBar('No internet connection', context);
              },
              child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent
                ),
                child: Center(child: Text("Login",style: TextStyle(fontSize: 25),)),
              ),
            ),
          )
        ],
      )
    );
  }
}
