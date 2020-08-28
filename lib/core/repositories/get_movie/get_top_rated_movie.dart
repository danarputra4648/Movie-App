import 'dart:convert';
import 'package:GrubNet/core/repositories/base/api_config.dart';

import '../../model/movie.dart';
import '../base/api_base_url.dart';

class GetTopRatedMovie extends BaseServices {
  Future<List<Detail>> getTopRatedMovie() async {
    List result;

    var response = await request(Api.topRatedUrl, RequestType.GET);

    if (response.statusCode == 200) {
      result = jsonDecode(response.body)['results'] as List;
    }
    return result.map((json) => Detail.fromJson(json)).toList();
  }
}
