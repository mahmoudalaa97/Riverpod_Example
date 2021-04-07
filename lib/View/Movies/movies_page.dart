import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/Model/MoviesModel.dart';
import 'package:state_managment/Services/Repositories/movies_repository.dart';
import 'package:state_managment/View/Movies/movie_view_page.dart';
import 'package:state_managment/Widgets/custom_search.dart';
import 'package:state_managment/Widgets/error_widget.dart';
import 'package:state_managment/Widgets/loading_widget.dart';

final moviesData = FutureProvider.family<MoviesModel, String>((ref, movieName) {
  MoviesRepository _moviesRepository = MoviesRepositoryApi();
  return _moviesRepository.fetchAllMovies(movieName);
});

final searchProvider = StateProvider<String>((ref) => "");

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies Page"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CustomSearchWidget(
              hint: "Write Movie Name here...",
              onFieldSubmitted: (value) {
                context.read(searchProvider).state = value;
              },
            ),
            Expanded(child: Consumer(
              builder: (context, watch, child) {
                return watch(moviesData(watch(searchProvider).state)).when(
                    data: (value) => MovieViewPage(
                          data: value,
                        ),
                    loading: () => LoadingWidget(),
                    error: (error, stackTrace) =>
                        CustomErrorWidget(error: error));
              },
            ))
          ],
        ),
      ),
    );
  }
}
