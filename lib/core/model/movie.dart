import 'package:equatable/equatable.dart';

class Detail extends Equatable {
  final int id;
  final String posterPath;
  final bool isAdult;
  final String overview;
  final String releaseDate;
  final List genreIds;
  final String title;
  final String backdropPath;
  final num popularity;
  final int voteCount;
  final bool isVideo;
  final num voteAverage;

  Detail({
    this.id,
    this.posterPath,
    this.isAdult,
    this.overview,
    this.releaseDate,
    this.genreIds,
    this.title,
    this.backdropPath,
    this.popularity,
    this.voteCount,
    this.isVideo,
    this.voteAverage,
  });

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: json['id'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'],
      isAdult: json['adult'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      popularity: json['popularity'],
      voteCount: json['vote_count'],
      isVideo: json['video'],
      voteAverage: json['vote_average'],
      posterPath: json['poster_path'],
    );
  }

  @override
  List<Object> get props => [
        id,
        posterPath,
        isAdult,
        overview,
        releaseDate,
        genreIds,
        title,
        backdropPath,
        popularity,
        voteCount,
        voteAverage,
        isVideo,
      ];
}

class Genre extends Equatable {
  final int id;
  final String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  List<Object> get props => [id, name];
}
