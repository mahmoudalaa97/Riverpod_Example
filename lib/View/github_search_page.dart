import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Model/UserGithubDataModel.dart';

final getDataForUser =
    FutureProvider.autoDispose<UserGithubDataModel>((ref) async {
  String _user = ref.watch(userName).state;
  Dio _dio = Dio();
  UserGithubDataModel _userGithubModel = UserGithubDataModel();
  String url = "https://api.github.com/users/$_user";
  Response _response = await _dio.get(url);
  if (_response.statusCode == 200)
    _userGithubModel = UserGithubDataModel.fromJson(_response.data);

  return _userGithubModel;
});

final userName = StateProvider<String>((ref) => "");

class GithubSearchPage extends StatefulWidget {
  @override
  _GithubSearchPageState createState() => _GithubSearchPageState();
}

class _GithubSearchPageState extends State<GithubSearchPage> {
  @override
  Widget build(BuildContext context) {
    print("Build Context : Github Search");
    return Scaffold(
      appBar: AppBar(
        title: Text("Github Search "),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Write Username here ..."
              ),
              onChanged: (value) {
                context.read(userName).state = value;
              },

            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Consumer(
                    builder: (context, watch, child) {
                      final future = watch(getDataForUser);
                      return future.when(
                          data: (data) {
                            return Container(
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: data.avatarUrl,
                                        height: 100,
                                        width: 100,
                                        progressIndicatorBuilder: (context, url, downloadProgress) =>
                                            CircularProgressIndicator(value: downloadProgress.progress),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        child: Text("${data.name}",style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,

                                        ),),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          _itemTitle(
                                            title: "Followers",
                                            data: data.followers.toString()
                                          ),
                                          _itemTitle(
                                              title: "Following",
                                              data: data.following.toString()
                                          ),
                                          _itemTitle(
                                              title: "public_gists",
                                              data: data.publicGists.toString()
                                          ),_itemTitle(
                                              title: "public_repos",
                                              data: data.publicRepos.toString()
                                          )
                                        ],
                                      )

                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          loading: () => Center(child: CircularProgressIndicator()),
                          error: (e, stack) {
                            DioError _dioError = e;
                            String error = _dioError.response.statusCode == 404
                                ? "Not Found"
                                : "Error $e";
                            print(e.runtimeType);
                            return Center(
                              child: Text("$error"),
                            );
                          });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemTitle({String title, String data}){
    return Container(
      width: 90,
      height: 55,
      child: Card(
        elevation: 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Text("$title",style: TextStyle(
                fontSize: 12,fontWeight: FontWeight.bold
              ),),
            ),
            Text("$data",style: TextStyle(
                fontSize: 11,fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }
}
