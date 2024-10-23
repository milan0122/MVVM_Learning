import 'package:mvvm_learnig/data/network/base_api_services.dart';
import 'package:mvvm_learnig/data/network/network_api_services.dart';
import 'package:mvvm_learnig/model/movies_list.dart';
import 'package:mvvm_learnig/res/app_urls.dart';

class HomeRepository{
  BaseApiServices _apiServices = NetworkApiServices();
  Future<MoviesList> fetchMoviesList() async{
    try{
      dynamic response  = await _apiServices.getGetApiResponse(AppUrls.moviesListEndPoint);
      return response= MoviesList.fromJson(response);
    }
    catch(e){
      throw e;
    }

  }
}