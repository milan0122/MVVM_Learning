import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvvm_learnig/data/response/api_response.dart';
import 'package:mvvm_learnig/model/movies_list.dart';
import 'package:mvvm_learnig/repository/home_repository.dart';
class HomeViewViewModel with ChangeNotifier{
  final _myRepo = HomeRepository();


//get method
  ApiResponse<MoviesList> moviesList = ApiResponse.loading();
//set method
  setMoviesList(ApiResponse<MoviesList>response){
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async{
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMoviesList().then((value){
      setMoviesList(ApiResponse.complete(value));

    }).onError((error,StackTrace){
      if(kDebugMode){
        print(error.toString());
        setMoviesList(ApiResponse.error(error.toString()));
      }

    });
  }

}