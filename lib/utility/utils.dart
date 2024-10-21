import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utils{

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg:message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG
    );
  }


  static void flushBarErrorMessage(String message, BuildContext context){
    showFlushbar(context: context,
        flushbar:Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          padding: EdgeInsets.all(10),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Colors.red,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          icon: Icon(Icons.error,size: 20,color: Colors.white,),
          duration: Duration(seconds: 5),
          title: 'Error',
          message: message,)..show(context) );
  }

  static snakBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message))
    );
  }
}