import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
class Utils{

  //calculating the average rating
  static double averageRating(List<int> rating){
    var avgRating = 0;
    for(int i=0;i<rating.length; i++){
      avgRating = avgRating + rating[i];

    }
    return double.parse((avgRating/rating.length).toStringAsFixed(1));
  }

  //uses for Input Focus (eg. when you click done in one input field it goes to another one)
  static void FieldFocusChange(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);

}

//use for show error like internet connection
  static toastMessage(String message){
    Fluttertoast.showToast(
        msg:message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_LONG
    );
  }

  //use for show error like internet connection
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
          message: message,)..show(context) );
  }
  //use for show error like internet connection
  static snakBar(String message,BuildContext context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
          content: Text(message))
    );
  }
}