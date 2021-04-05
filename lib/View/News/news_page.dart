import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Model/NewsModel.dart';
import 'package:state_managment/Services/Repositories/news_repository.dart';
import 'package:state_managment/View/News/view_news_page.dart';

import '../../utils/extentions.dart';

final fetchNewsData = FutureProvider<NewsModel>((ref) async {
  NewsRepository _newsRepository = NewsRepositoryApi();

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
                  child: CardNewsWidget(
                    title: value.articles[index].title,
                    description: value.articles[index].description,
                    urlPhoto: value.articles[index].urlToImage,
                    urlNews: value.articles[index].url,
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

class CardNewsWidget extends StatelessWidget {
  final String urlPhoto;
  final String urlNews;
  final String title;
  final String description;
  final VoidCallback onTap;

  const CardNewsWidget({Key key, this.urlPhoto, this.title, this.description, this.onTap, this.urlNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap??(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewNewsPage(url: urlNews,),));
      },
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: urlPhoto,
                fit: BoxFit.cover,
                height: 90,
                width: 90,
              )),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("$title",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "$description",
                      maxLines: 10,
                      style: TextStyle(
                          fontSize: 11, color: Colors.white.withOpacity(0.6)),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
