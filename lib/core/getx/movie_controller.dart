import 'package:GrubNet/core/model/movie.dart';
import 'package:GrubNet/core/repositories/movie_api_helper.dart';
import 'package:GrubNet/core/view_model/movie_view_model.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  // static get controller => Get.put(MovieController());

  final _service = Get.put(MovieAPIProvider());

  var pageIndex = 0.obs;

  List<DetailViewModel> detailViewModel = List<DetailViewModel>();
  List<DetailViewModel> upcomingViewModel = List<DetailViewModel>();
  List<DetailViewModel> popularViewModel = List<DetailViewModel>();
  List<DetailViewModel> recommendViewModel = List<DetailViewModel>();

  List<GenreViewModel> genreViewModel = List<GenreViewModel>();

  Future<void> getUpcomingData() async {
    List<Detail> upcoming = await _service.getUpcomingMovie();
    upcomingViewModel =
        upcoming.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  Future<void> getPopularData() async {
    List<Detail> recomended = await _service.getPopularMovie();
    popularViewModel =
        recomended.map((data) => DetailViewModel(detail: data)).toList();
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

  Future<void> getRecommendedData() async {
    List<Detail> recommeded = await _service.getRecommendMovie();
    recommendViewModel =
        recommeded.map((data) => DetailViewModel(detail: data)).toList();
    update();
  }

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    pageIndex.value = index;
    update();
  }

  @override
  void onInit() {
    getGenreData();
    getSearchData();
    getPopularData();
    getUpcomingData();
    getRecommendedData();
    super.onInit();
  }
}
