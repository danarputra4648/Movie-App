import 'dart:convert';

import '../../model/movie.dart';
import '../base/api_base_url.dart';
import '../base/api_config.dart';

class GetSimiliarMovie extends BaseServices {
  Future<List<Detail>> getSimiliarMovie(int movieId) async {
    List result;

    var response = await request(
        Api.similiarMovieUrl.replaceAll('550', movieId.toString()),
        RequestType.GET);

    if (response.statusCode == 200) {
      result = jsonDecode(response.body)['results'] as List;
    }
    return result.map((json) => Detail.fromJson(json)).toList();
  }
}
