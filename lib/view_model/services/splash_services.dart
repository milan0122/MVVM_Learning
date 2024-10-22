import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_learnig/model/user_token_model.dart';
import 'package:mvvm_learnig/utility/routes/routes_name.dart';
import 'package:mvvm_learnig/view_model/user_view_model.dart';

class SplashServices{


  void checkAuthentication(BuildContext context)async{
    Future<UserTokenModel> getUserData() => UserViewModel().getUser();

    getUserData().then((value)async {

      if(value.token=='null'||value.token==''){
        await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RouteName.login);
      }
      else{
       await Future.delayed(Duration(seconds: 3));
       await Navigator.pushNamed(context, RouteName.home);
      }

    }).onError((error,stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });
  }

}