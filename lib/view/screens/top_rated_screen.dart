import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constant.dart';
import '../../core/view_model/arguments_view_model.dart';
import '../../core/view_model/movie_view_model.dart';

class TopRatedScreen extends StatelessWidget {
  final args = Get.put(ArgumentesViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieViewModel>(
        init: MovieViewModel(),
        builder: (movie) => ListView.builder(
          itemBuilder: (context, index) => InkWell(
            splashColor: Colors.grey[700],
            onTap: () => args.topRatedArgs(index),
            child: Stack(
              children: [
                buildPosterBackground(movie, index),
                buildPosterImage(movie, index),
              ],
            ),
          ),
          itemCount: movie.genreViewModel.length,
        ),
      ),
    );
  }

  Container buildPosterBackground(MovieViewModel movie, int index) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      height: 150,
      color: disabledIconColor,
      child: Row(
        children: [
          Spacer(
            flex: 3,
          ),
          buildMovieInfo(movie, index),
        ],
      ),
    );
  }

  Expanded buildMovieInfo(MovieViewModel movie, int index) {
    return Expanded(
      flex: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            movie.topRatedViewModel[index].title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 16,
              letterSpacing: 1.2,
            ),
          ),
          Chip(
            avatar: Icon(
              Icons.thumb_up,
            ),
            label: Text(
              NumberFormat.compact()
                  .format(movie.topRatedViewModel[index].voteCount),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Text(
            movie.topRatedViewModel[index].overview,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[700],
            ),
          )
        ],
      ),
    );
  }

  Positioned buildPosterImage(MovieViewModel movie, int index) {
    return Positioned(
      top: 0,
      left: 40,
      bottom: 40,
      child: CachedNetworkImage(
        imageUrl:
            'https://image.tmdb.org/t/p/w185${movie.topRatedViewModel[index].posterPath}',
        imageBuilder: (context, imageProvider) => Container(
          clipBehavior: Clip.antiAlias,
          width: 120,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
