
import 'package:mvvm_learnig/data/network/base_api_services.dart';
import 'package:mvvm_learnig/data/network/network_api_services.dart';
import 'package:mvvm_learnig/res/app_urls.dart';

class AuthRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  //For login api
  Future<dynamic> loginApi(dynamic data) async{
    try{
      dynamic response  = await _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    }
        catch(e){
      throw e;
        }

  }
//for signup api
  Future<dynamic> SignUpApi(dynamic data) async{
    try{
      dynamic response  = await _apiServices.getGetApiResponse(AppUrls.registerApi);
      return response;
    }
    catch(e){
      throw e;
    }

  }

}