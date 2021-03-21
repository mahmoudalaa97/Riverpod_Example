import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod1/Model/NewsModel.dart';

final fetchNewsData = FutureProvider.autoDispose<NewsModel>((ref) async {
  Dio dio = Dio();
  NewsModel _newsModel;
  const url =
      "https://newsapi.org/v2/everything?q=Apple&from=2021-03-20&sortBy=popularity&apiKey=4419d327234140b6b60bb2f4874aa8f1";
  Response response = await dio.get(url);
  if (response.statusCode == 200) {
    _newsModel = NewsModel.fromJson(response.data);
  }
  return _newsModel;
});

class NewsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    print("Build Context");
    final future = watch(fetchNewsData);
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
      ),
      body: future.when(
          data: (value) {
            return ListView.builder(
              itemCount: value.articles.length,
              padding: EdgeInsets.all(10),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text("${value.articles[index].title}"),
                    subtitle: Text("${value.articles[index].description}"),
                  ),
                );
              },
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error: (e, stack) {
            return Text("$e");
          }),
    );
  }
}
