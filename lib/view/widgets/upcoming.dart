import 'package:GrubNet/core/getx/arguments_controller.dart';
import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Upcoming extends StatelessWidget {
  final movie = Get.put(MovieController());
  final args = Get.put(ArgumentsController());
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: movie.upcomingViewModel.length,
      itemBuilder: (context, index) => CachedNetworkImage(
        errorWidget: (context, url, error) => FlutterLogo(),
        imageBuilder: (context, imageProvider) => InkWell(
          splashColor: Colors.grey[700],
          onTap: () => args.upcomingArgs(index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 185,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: imageProvider, fit: BoxFit.fill),
            ),
          ),
        ),
        imageUrl:
            'https://image.tmdb.org/t/p/w185${movie.upcomingViewModel[index].posterImg}',
      ),
      options: CarouselOptions(
        viewportFraction: 0.5,
        height: 200,
        enableInfiniteScroll: true,
      ),
    );
  }
}
