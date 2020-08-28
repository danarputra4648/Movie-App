import 'dart:convert';

import 'package:GrubNet/core/repositories/base/api_config.dart';

import '../../model/movie.dart';
import '../base/api_base_url.dart';

class GetUpcomingMovie extends BaseServices {
  Future<List<Detail>> getUpcomingMovie() async {
    List result;
    var response = await request(Api.upcomingMovieUrl, RequestType.GET);

    if (response.statusCode == 200) {
      result = (jsonDecode(response.body))['results'];
    }
    return result.map((json) => Detail.fromJson(json)).toList();
  }
}
