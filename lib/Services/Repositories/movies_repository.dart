import 'package:dio/dio.dart';
import 'package:state_managment/Model/MoviesModel.dart';

import '../ServicesConstant.dart';

abstract class MoviesRepository{
  Future<MoviesModel> fetchAllMovies(String movieName);
}


class MoviesRepositoryApi extends MoviesRepository{
  @override
  Future<MoviesModel> fetchAllMovies(String movieName) async{
    final _response = await ServicesConstant.instanceDio.get(ServicesConstant.movieUrlAPI,queryParameters: {
      "query":"$movieName",
      "language":"en-US",
      "page":"1",
      "include_adult":"false"
    });
    if (_response.statusCode == 200)
      return  MoviesModel.fromJson(_response.data);
    else
      throw DioError();
  }

}
