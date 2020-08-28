import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../view/routes/routes_name.dart';
import 'movie_view_model.dart';

class ArgumentesViewModel {
  void getArguments({
    @required int id,
    @required String title,
    @required String overview,
    @required List genres,
    @required String backdropImg,
    @required String posterImg,
    @required String date,
    @required double voteAvg,
  }) {
    Get.toNamed(
      detailScreen,
      arguments: {
        'backdrop_img': 'https://image.tmdb.org/t/p/w300$backdropImg',
        'poster_img': 'https://image.tmdb.org/t/p/w300$posterImg',
        'overview': overview,
        'genres': genres,
        'title': title,
        'id': id.toString(),
        'date': date,
        'vote_avg': voteAvg,
      },
    );
  }

  final movie = Get.put(MovieViewModel());

  void nowPlayArgs(int index) {
    movie.movieId.value = movie.nowPlayViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.nowPlayViewModel[index].id,
      backdropImg: movie.nowPlayViewModel[index].backdropPath,
      posterImg: movie.nowPlayViewModel[index].posterPath,
      genres: movie.nowPlayViewModel[index].genreIds,
      overview: movie.nowPlayViewModel[index].overview,
      title: movie.nowPlayViewModel[index].title,
      date: movie.nowPlayViewModel[index].releaseDate,
      voteAvg: movie.nowPlayViewModel[index].voteAverage,
    );
  }

  void upcomingArgs(int index) {
    movie.movieId.value = movie.upcomingViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.upcomingViewModel[index].id,
      backdropImg: movie.upcomingViewModel[index].backdropPath,
      posterImg: movie.upcomingViewModel[index].posterPath,
      genres: movie.upcomingViewModel[index].genreIds,
      overview: movie.upcomingViewModel[index].overview,
      title: movie.upcomingViewModel[index].title,
      date: movie.upcomingViewModel[index].releaseDate,
      voteAvg: movie.upcomingViewModel[index].voteAverage,
    );
  }

  void popularArgs(int index) {
    movie.movieId.value = movie.popularViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.popularViewModel[index].id,
      backdropImg: movie.popularViewModel[index].backdropPath,
      posterImg: movie.popularViewModel[index].posterPath,
      genres: movie.popularViewModel[index].genreIds,
      overview: movie.popularViewModel[index].overview,
      title: movie.popularViewModel[index].title,
      date: movie.popularViewModel[index].releaseDate,
      voteAvg: movie.popularViewModel[index].voteAverage,
    );
  }

  void topRatedArgs(int index) {
    movie.movieId.value = movie.topRatedViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.topRatedViewModel[index].id,
      backdropImg: movie.topRatedViewModel[index].backdropPath,
      posterImg: movie.topRatedViewModel[index].posterPath,
      genres: movie.topRatedViewModel[index].genreIds,
      overview: movie.topRatedViewModel[index].overview,
      title: movie.topRatedViewModel[index].title,
      date: movie.topRatedViewModel[index].releaseDate,
      voteAvg: movie.topRatedViewModel[index].voteAverage,
    );
  }
}
