import 'package:GrubNet/core/model/movie.dart';
import 'package:GrubNet/core/repositories/movie_api_helper.dart';
import 'package:GrubNet/core/view_model/movie_view_model.dart';
import 'package:get/get.dart';

class MovieInjection extends GetxController {
  final _service = Get.put(MovieAPIProvider());

  var movieId = 550.obs;
  // var movieKey = '2ZAdcWHuCmY'.obs;
  List<GenreViewModel> genreViewModel = List<GenreViewModel>();

  List<DetailViewModel> detailViewModel = List<DetailViewModel>();
  List<DetailViewModel> upcomingViewModel = List<DetailViewModel>();
  List<DetailViewModel> popularViewModel = List<DetailViewModel>();
  List<DetailViewModel> recommendViewModel = List<DetailViewModel>();
  List<DetailViewModel> topRatedViewModel = List<DetailViewModel>();
  List<DetailViewModel> nowPlayViewModel = List<DetailViewModel>();
  List<DetailViewModel> similiarViewModel = List<DetailViewModel>();

  Future<void> getSimiliarData() async {
    List<Detail> similiar = await _service.getSimiliarMovie(movieId.value);
    similiarViewModel =
        similiar.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  Future<void> getTopRatedData() async {
    List<Detail> topRated = await _service.getTopRatedMovie();
    topRatedViewModel =
        topRated.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  Future<void> getUpcomingData() async {
    List<Detail> upcoming = await _service.getUpcomingMovie();
    upcomingViewModel =
        upcoming.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  Future<void> getPopularData() async {
    List<Detail> popular = await _service.getPopularMovie();
    popularViewModel =
        popular.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  Future<void> getSearchData() async {
    List<Detail> search = await _service.getSearchMovie();
    detailViewModel =
        search.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  Future<void> getGenreData() async {
    List<Genre> genre = await _service.getGenreMovie();
    genreViewModel = genre.map((data) => GenreViewModel(genre: data)).toList();
    update();
  }

  Future<void> getNowPlayData() async {
    List<Detail> nowPlay = await _service.getNowPlayMovie();
    nowPlayViewModel =
        nowPlay.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  @override
  void onInit() {
    getSimiliarData();
    getGenreData();
    getSearchData();
    getPopularData();
    getUpcomingData();
    getNowPlayData();
    getTopRatedData();
    super.onInit();
  }
}
