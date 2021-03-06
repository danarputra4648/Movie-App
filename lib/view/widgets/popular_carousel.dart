import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../core/utils/number_format.dart';
import '../../core/view_model/arguments_view_model.dart';
import '../../core/view_model/movie_view_model.dart';

class PopularCarousel extends StatelessWidget {
  final movie = Get.put(MovieViewModel());
  final args = Get.put(ArgumentesViewModel());

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount:
          movie.popularViewModel.map((movies) => movies.posterPath).length,
      itemBuilder: (context, index) => InkWell(
        borderRadius: BorderRadius.circular(5),
        splashColor: Colors.grey[700],
        onTap: () => args.popularArgs(index),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(index),
            buildTitle(index),
            buildRating(index),
          ],
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 0.3,
      ),
    );
  }

  Padding buildRating(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Chip(
            avatar: FaIcon(
              FontAwesomeIcons.solidThumbsUp,
              size: 14,
              color: Colors.yellow,
            ),
            label: Text(
              numberConvert(movie.popularViewModel[index].voteCount),
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTitle(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        movie.popularViewModel[index].title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget buildImage(int index) {
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 200,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Chip(
            avatar: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
            label: Text(
              movie.popularViewModel[index].voteAverage.toStringAsPrecision(2),
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
      errorWidget: (context, url, error) => FlutterLogo(),
      placeholder: (context, url) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: 200,
        height: 150,
      ),
      imageUrl:
          'https://image.tmdb.org/t/p/w300${movie.popularViewModel[index].posterPath}',
    );
  }
}
