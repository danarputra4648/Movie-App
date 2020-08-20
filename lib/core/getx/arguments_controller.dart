import 'package:GrubNet/view/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArgumentsController {
  void getArguments({
    @required int id,
    @required String title,
    @required String overview,
    @required List genres,
    @required String backdropImg,
    @required String posterImg,
  }) {
    Get.toNamed(
      DetailScreen.routeName,
      arguments: {
        'backdrop_img': 'https://image.tmdb.org/t/p/w300$backdropImg',
        'poster_img': 'https://image.tmdb.org/t/p/w300$posterImg',
        'overview': overview,
        'genres': genres,
        'title': title,
        'id': id.toString(),
      },
    );
  }
}
