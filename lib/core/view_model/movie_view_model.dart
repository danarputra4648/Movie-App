import 'package:GrubNet/core/model/movie.dart';

class DetailViewModel {
  Detail _search;
  DetailViewModel({Detail detail}) : _search = detail;

  int get id => _search.id;
  String get posterImg => _search.posterPath;
  String get backdropImg => _search.backdropPath;
  int get voteCount => _search.voteCount;
  num get voteAvg => _search.voteAverage;
  bool get isVideo => _search.isVideo;
  bool get isAdult => _search.isAdult;
  num get popularity => _search.popularity;
  String get description => _search.overview;
  String get title => _search.title;
  String get publishDate => _search.releaseDate;
  List get genres => _search.genreIds;
}

class GenreViewModel {
  Genre _genre;
  GenreViewModel({Genre genre}) : _genre = genre;

  int get id => _genre.id;
  String get name => _genre.name;
}
