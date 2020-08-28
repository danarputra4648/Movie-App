import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';

import '../../model/movie.dart';
import '../base/api_base_url.dart';

class GetSearchMovie {
  Future<List<Detail>> getSearchMovie() async {
    List list;
    try {
      final response = await get(Api.apiUrl);
      if (response.statusCode == 200) {
        list = jsonDecode(response.body)['results'];
        return list.map((json) => Detail.fromJson(json)).toList();
      }
      print(jsonDecode(response.body)['status_message']);
      throw HttpException(response.body);
    } on HttpException catch (e) {
      throw e.message;
    }
  }
}
