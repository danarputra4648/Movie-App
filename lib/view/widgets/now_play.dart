import 'dart:ui';

import 'package:GrubNet/constant.dart';
import 'package:GrubNet/core/getx/arguments_controller.dart';
import 'package:GrubNet/core/getx/movie_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NowPlay extends StatelessWidget {
  final movie = Get.put(MovieController());
  final args = Get.put(ArgumentsController());

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: CarouselController(),
      itemCount: movie.nowPlayViewModel.map((e) => e.posterImg).length >= 5
          ? 5
          : movie.nowPlayViewModel.map((e) => e.posterImg).length,
      itemBuilder: (context, index) => InkWell(
        splashColor: disabledIconColor,
        onTap: () => args.getArguments(
          id: movie.nowPlayViewModel[index].id,
          backdropImg: movie.nowPlayViewModel[index].backdropImg,
          posterImg: movie.nowPlayViewModel[index].posterImg,
          genres: movie.nowPlayViewModel[index].genres,
          overview: movie.nowPlayViewModel[index].overview,
          title: movie.nowPlayViewModel[index].title,
        ),
        child: CachedNetworkImage(
          errorWidget: (context, url, error) => FlutterLogo(),
          placeholder: (context, url) => Container(
            width: 300,
          ),
          imageUrl:
              'https://image.tmdb.org/t/p/w300${movie.nowPlayViewModel[index].posterImg}',
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
