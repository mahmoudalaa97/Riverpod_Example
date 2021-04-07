import 'package:dio/dio.dart';

import 'interceptors/AppInterceptor.dart';

class ServicesConstant {
  static Dio get instanceDio {
    Dio _dio = Dio(
    );
    _dio.interceptors.add(AppInterceptors());
    return _dio;
  }


  static String baseUrl = "";

  ///Github API
  static String githubUrlAPI = "https://api.github.com/users/";

  ///News API
  static String newsUrlAPI = "https://newsapi.org/v2/everything?q=Apple&from=2021-03-20&sortBy=popularity&apiKey=4419d327234140b6b60bb2f4874aa8f1";

  /// Move API
  static String movieUrlAPI = "https://api.themoviedb.org/3/search/movie?api_key=398652d590bd6cd5c768c67e321db8e6";

}