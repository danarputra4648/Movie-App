import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:GrubNet/view/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentsController {
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
      DetailScreen.routeName,
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

  final movie = Get.put(MovieController());

  void nowPlayArgs(int index) {
    movie.movieId.value = movie.nowPlayViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.nowPlayViewModel[index].id,
      backdropImg: movie.nowPlayViewModel[index].backdropImg,
      posterImg: movie.nowPlayViewModel[index].posterImg,
      genres: movie.nowPlayViewModel[index].genres,
      overview: movie.nowPlayViewModel[index].overview,
      title: movie.nowPlayViewModel[index].title,
      date: movie.nowPlayViewModel[index].publishDate,
      voteAvg: movie.nowPlayViewModel[index].voteAvg,
    );
  }

  void upcomingArgs(int index) {
    movie.movieId.value = movie.upcomingViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.upcomingViewModel[index].id,
      backdropImg: movie.upcomingViewModel[index].backdropImg,
      posterImg: movie.upcomingViewModel[index].posterImg,
      genres: movie.upcomingViewModel[index].genres,
      overview: movie.upcomingViewModel[index].overview,
      title: movie.upcomingViewModel[index].title,
      date: movie.upcomingViewModel[index].publishDate,
      voteAvg: movie.upcomingViewModel[index].voteAvg,
    );
  }

  void popularArgs(int index) {
    movie.movieId.value = movie.popularViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.popularViewModel[index].id,
      backdropImg: movie.popularViewModel[index].backdropImg,
      posterImg: movie.popularViewModel[index].posterImg,
      genres: movie.popularViewModel[index].genres,
      overview: movie.popularViewModel[index].overview,
      title: movie.popularViewModel[index].title,
      date: movie.popularViewModel[index].publishDate,
      voteAvg: movie.popularViewModel[index].voteAvg,
    );
  }

  void topRatedArgs(int index) {
    movie.movieId.value = movie.topRatedViewModel[index].id;
    var id = movie.movieId.value;
    print(id);
    movie.getSimiliarData();

    getArguments(
      id: movie.topRatedViewModel[index].id,
      backdropImg: movie.topRatedViewModel[index].backdropImg,
      posterImg: movie.topRatedViewModel[index].posterImg,
      genres: movie.topRatedViewModel[index].genres,
      overview: movie.topRatedViewModel[index].overview,
      title: movie.topRatedViewModel[index].title,
      date: movie.topRatedViewModel[index].publishDate,
      voteAvg: movie.topRatedViewModel[index].voteAvg,
    );
  }
}
