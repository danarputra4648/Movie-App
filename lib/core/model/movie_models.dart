import 'package:GrubNet/core/model/movie.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'movie.g.dart';

@HiveType(typeId: 1)
class DetailModel extends Detail {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String posterPath;

  @HiveField(2)
  final bool isAdult;

  @HiveField(3)
  final String overview;

  @HiveField(4)
  final String releaseDate;

  @HiveField(5)
  final List genreIds;

  @HiveField(6)
  final String title;

  @HiveField(7)
  final String backdropPath;

  @HiveField(8)
  final num popularity;

  @HiveField(9)
  final int voteCount;

  @HiveField(10)
  final bool isVideo;

  @HiveField(11)
  final num voteAverage;

  DetailModel({
    @required this.id,
    @required this.posterPath,
    @required this.isAdult,
    @required this.overview,
    @required this.releaseDate,
    @required this.genreIds,
    @required this.title,
    @required this.backdropPath,
    @required this.popularity,
    @required this.voteCount,
    @required this.isVideo,
    @required this.voteAverage,
  }) : super(
          id: id,
          posterPath: posterPath,
          isAdult: isAdult,
          overview: overview,
          releaseDate: releaseDate,
          genreIds: genreIds,
          title: title,
          backdropPath: backdropPath,
          popularity: popularity,
          voteAverage: voteAverage,
          isVideo: isVideo,
          voteCount: voteCount,
        );

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
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
}

@HiveType(typeId: 2)
class GenreModel extends Genre {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  GenreModel({
    @required this.id,
    @required this.name,
  }) : super(id: id, name: name);

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
