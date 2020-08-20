import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

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
  });

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

  Genre({
    @required this.id,
    @required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
