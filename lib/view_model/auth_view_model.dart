import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_learnig/model/user_token_model.dart';
import 'package:mvvm_learnig/repository/auth_repository.dart';
import 'package:mvvm_learnig/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utility/routes/routes_name.dart';
import '../utility/utils.dart';


class AuthViewModel with ChangeNotifier{
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context)async{
    setLoading(true);//until api hits
   _myRepo.loginApi(data).then((value){
     setLoading(false);//after api hits
//saving the token
    final usp = Provider.of<UserViewModel>(context,listen: false);
    usp.saveUser(
      UserTokenModel(
        token: value['token'].toString()
      )
    );

     Utils.flushBarErrorMessage('Login Successfully', context);
     Navigator.pushNamed(context, RouteName.home);


     if(kDebugMode){

       print(value.toString());
     }


   }).onError((error,stackTrace){
     setLoading(false);//after api errors
     if(kDebugMode){
       Utils.toastMessage(error.toString());
       print(error.toString());
     }

   });
  }

  Future<void> signUpApi(dynamic data, BuildContext context)async{
    setLoading(true);//until api hits
    _myRepo.signUpApi(data).then((value){
      setLoading(false);//after api hits

      Utils.flushBarErrorMessage('Register Successfully', context);
      Navigator.pushNamed(context, RouteName.login);


      if(kDebugMode){

        print(value.toString());
      }


    }).onError((error,stackTrace){
      setLoading(false);//after api errors

      if(kDebugMode){
        Utils.toastMessage(error.toString());
        print(error.toString());
      }

    });
  }
}