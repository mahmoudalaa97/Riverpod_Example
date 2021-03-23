import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Model/NewsModel.dart';
import 'package:state_managment/Services/Repositories/news_repository.dart';
import '../utils/extentions.dart';


final fetchNewsData = FutureProvider<NewsModel>((ref) async {
   NewsRepository _newsRepository= NewsRepositoryApi();

  return _newsRepository.fetchAllNews();
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
                  color: Theme.of(context).colorScheme.gridViewButtonColor,
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
