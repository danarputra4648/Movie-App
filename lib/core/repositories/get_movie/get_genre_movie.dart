import 'dart:convert';

import 'package:GrubNet/core/repositories/base/api_config.dart';

import '../../model/movie.dart';
import '../base/api_base_url.dart';

class GetGenreMovie extends BaseServices {
  Future<List<Genre>> getGenreMovie() async {
    List result;

    var response = await request(Api.genreMovieUrl, RequestType.GET);

    if (response.statusCode == 200) {
      result = jsonDecode(response.body)['genres'];
    }
    return result.map((json) => Genre.fromJson(json)).toList();
  }
}
