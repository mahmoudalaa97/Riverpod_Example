import 'package:dio/dio.dart';
import 'package:state_managment/Model/UserGithubDataModel.dart';
import 'package:state_managment/Services/constant.dart';

abstract class GithubRepository {
  Future<UserGithubDataModel> fetchUserData(String username);
}

class GithubRepositoryApi extends GithubRepository{
  @override
  Future<UserGithubDataModel> fetchUserData(String username)async {
    String url = "https://api.github.com/users/$username";
    final _response = await ServicesConstant.instanceDio.get(url);
    if (_response.statusCode == 200)
     return  UserGithubDataModel.fromJson(_response.data);
    else
      throw DioError();
  }

}