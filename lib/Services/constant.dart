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

}