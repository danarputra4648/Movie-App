import 'package:GrubNet/constant.dart';
import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TopRatedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MovieController>(
        init: MovieController(),
        builder: (movie) => ListView.builder(
          itemBuilder: (context, index) => Stack(
            children: [
              buildPosterBackground(movie, index),
              buildPosterImage(movie, index),
            ],
          ),
          itemCount: movie.genreViewModel.length,
        ),
      ),
    );
  }

  Container buildPosterBackground(MovieController movie, int index) {
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

  Expanded buildMovieInfo(MovieController movie, int index) {
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

  Positioned buildPosterImage(MovieController movie, int index) {
    return Positioned(
      top: 0,
      left: 40,
      bottom: 40,
      child: CachedNetworkImage(
        imageUrl:
            'https://image.tmdb.org/t/p/w185${movie.topRatedViewModel[index].posterImg}',
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
