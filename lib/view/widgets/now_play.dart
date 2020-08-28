import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant.dart';
import '../../core/view_model/arguments_view_model.dart';
import '../../core/view_model/movie_view_model.dart';

class NowPlay extends StatelessWidget {
  final movie = Get.put(MovieViewModel());
  final args = Get.put(ArgumentesViewModel());

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: CarouselController(),
      itemCount: 5,
      itemBuilder: (context, index) => InkWell(
        splashColor: disabledIconColor,
        onTap: () => args.nowPlayArgs(index),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => FlutterLogo(),
          placeholder: (context, url) => Container(
            width: 300,
          ),
          imageUrl:
              'https://image.tmdb.org/t/p/w300${movie.nowPlayViewModel[index].posterPath}',
          width: 300,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                colorFilter:
                    ColorFilter.mode(primaryColor, BlendMode.softLight),
                image: imageProvider,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        viewportFraction: 0.7,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        enlargeCenterPage: true,
        autoPlayCurve: Curves.bounceOut,
        height: 300,
        enableInfiniteScroll: true,
        onPageChanged: movie.onPageChanged,
      ),
    );
  }
}
