import 'package:GrubNet/core/model/movie.dart';
import 'package:GrubNet/core/repositories/get_movie/get_genre_movie.dart';
import 'package:GrubNet/core/repositories/get_movie/get_now_play_movie.dart';
import 'package:GrubNet/core/repositories/get_movie/get_popular_movie.dart';
import 'package:GrubNet/core/repositories/get_movie/get_similiar_movie.dart';
import 'package:GrubNet/core/repositories/get_movie/get_top_rated_movie.dart';
import 'package:GrubNet/core/repositories/get_movie/get_upcoming_movie.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class MovieViewModel extends GetxController {
  // Declare object variable
  List<Genre> genreViewModel = List<Genre>();
  List<Detail> detailViewModel = List<Detail>();
  List<Detail> upcomingViewModel = List<Detail>();
  List<Detail> popularViewModel = List<Detail>();
  List<Detail> recommendViewModel = List<Detail>();
  List<Detail> topRatedViewModel = List<Detail>();
  List<Detail> nowPlayViewModel = List<Detail>();
  List<Detail> similiarViewModel = List<Detail>();

  // Object will get observable
  var pageIndex = 0.obs;
  var movieId = 550.obs;

  // Method to populate all get_movie repositories
  Future<void> getSimiliarData() async {
    similiarViewModel =
        await GetSimiliarMovie().getSimiliarMovie(movieId.value);
    update();
  }

  Future<void> getTopRatedData() async {
    topRatedViewModel = await GetTopRatedMovie().getTopRatedMovie();
    update();
  }

  Future<void> getUpcomingData() async {
    upcomingViewModel = await GetUpcomingMovie().getUpcomingMovie();
    update();
  }

  Future<void> getPopularData() async {
    popularViewModel = await GetPopularMovie().getPopularMovie();
    update();
  }

  // Future<void> getSearchData() async {
  //   searchDetail = GetSearchMovie().getSearchMovie();
  //   update();
  // }

  Future<void> getGenreData() async {
    genreViewModel = await GetGenreMovie().getGenreMovie();
    update();
  }

  Future<void> getNowPlayData() async {
    nowPlayViewModel = await GetNowPlayMovie().getNowPlayMovie();
    update();
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    pageIndex.value = index;
    update();
  }

  @override
  void onInit() {
    getSimiliarData();
    getGenreData();
    // getSearchData();
    getPopularData();
    getUpcomingData();
    getNowPlayData();
    getTopRatedData();
    super.onInit();
  }
}
