import 'package:dio/dio.dart';
import 'package:state_managment/Model/NewsModel.dart';
import 'package:state_managment/Services/ServicesConstant.dart';

abstract class NewsRepository {
  Future<NewsModel> fetchAllNews();
}

class NewsRepositoryApi extends NewsRepository {
  @override
  Future<NewsModel> fetchAllNews() async {
    Response _response =
        await ServicesConstant.instanceDio.get("${ServicesConstant.newsUrl}");
    if (_response.statusCode == 200)
      return NewsModel.fromJson(_response.data);
    else
      throw DioError();
  }
}

class NewsRepositoryLocal extends NewsRepository {
  @override
  Future<NewsModel> fetchAllNews() {
    NewsModel _newsModel = NewsModel(articles: [
      Article(
        title: "Test",
        author: "Test",
        description: "Hello",
        content: "Description",
      ),
      Article(
        title: "Test1",
        author: "Test1",
        description: "Hello1",
        content: "Description1",
      ),
      Article(
        title: "Tes2t",
        author: "Test2",
        description: "Hello2",
        content: "Description2",
      )
    ], status: "200", totalResults: 10);

    return Future.delayed(Duration(seconds: 5),(){
      return _newsModel;
    });
  }
}
