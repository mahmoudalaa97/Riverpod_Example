import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:state_managment/Model/MoviesModel.dart';


class MovieViewPage extends StatelessWidget {
  final MoviesModel data;
  const MovieViewPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: data.results.length,
      itemBuilder: (context, index) => _MovieItem(
        result: data.results[index],
      ),
    );
  }
}
class _MovieItem extends StatelessWidget {
  final Result result;

  const _MovieItem({Key key, this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: size.width,
      child: Stack(
        children: [
          Positioned(
            left: 55,
            right: 0,
            bottom: 5,
            top: 5,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 50, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${result.title}",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "${result.overview}",
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(.7)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: "https://image.tmdb.org/t/p/w500${result.posterPath}",
                height: 115,
                width: 90,
                filterQuality: FilterQuality.low,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
              left: 30,
              bottom: 5,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).cardColor.withOpacity(0.8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                      child: Text(
                    "${result.voteAverage}",
                    style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
