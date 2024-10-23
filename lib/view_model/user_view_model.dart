import 'package:flutter/foundation.dart';
import 'package:mvvm_learnig/model/user_token_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
  //saving the user token after login
  Future<bool> saveUser(UserTokenModel user)async{

    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;

  }
  //using same token to give access until token expires
  Future<UserTokenModel> getUser() async{
    final SharedPreferences sp =await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserTokenModel(
      token: token
    );
  }
  //remove tokens (method 1)
// void removeUser() async{
//   final SharedPreferences sp =await SharedPreferences.getInstance();
//   sp.clear();
//
// }


 // user can be remove using Future function(method2)
Future<bool> removeUser() async{
   final SharedPreferences sp =await SharedPreferences.getInstance();
    return sp.clear();
}
}