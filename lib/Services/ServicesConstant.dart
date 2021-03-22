import 'package:dio/dio.dart';

import 'interceptors/AppInterceptor.dart';

class ServicesConstant{
  static Dio get instanceDio {
    Dio _dio = Dio(
    );
    _dio.interceptors.add(AppInterceptors());
    return _dio;
  }


  static String baseUrl="";

  static String getUserInfoUrl="https://api.github.com/users/";

  static String newsUrl="https://newsapi.org/v2/everything?q=Apple&from=2021-03-20&sortBy=popularity&apiKey=4419d327234140b6b60bb2f4874aa8f1";

}