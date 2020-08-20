import 'dart:convert';
import 'dart:io';

import 'package:GrubNet/core/model/movie.dart';
import 'package:http/http.dart';

import '../../api_key.dart';

abstract class Services {
  Future<List<Detail>> getSearchMovie();
  Future<List<Genre>> getGenreMovie();
  Future<List<Detail>> getPopularMovie();
  Future<List<Detail>> getRecommendMovie();
  Future<List<Detail>> getUpcomingMovie();
}

class MovieAPIProvider extends Services {
  @override
  Future<List<Detail>> getSearchMovie() async {
    List list;
    try {
      final response = await get(apiUrl);
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

  @override
  Future<List<Genre>> getGenreMovie() async {
    List result;
    try {
      final response = await get(
          'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US');
      if (response.statusCode == 200) {
        result = (jsonDecode(response.body))['genres'];
        return result.map((json) => Genre.fromJson(json)).toList();
      }
      print(jsonDecode(response.body)['status_message']);
      throw HttpException(response.body);
    } on HttpException catch (e) {
      print(e.message);
    }
    return [];
  }

  @override
  Future<List<Detail>> getPopularMovie() async {
    List result;
    try {
      final response = await get(
          'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1');
      if (response.statusCode == 200) {
        result = (jsonDecode(response.body))['results'];
        return result.map((json) => Detail.fromJson(json)).toList();
      }
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
    return [];
  }

  @override
  Future<List<Detail>> getRecommendMovie() async {
    List result;
    try {
      final response = await get(
          'https://api.themoviedb.org/3/movie/550/recommendations?api_key=$apiKey&language=en-US&page=1');
      result = (jsonDecode(response.body))['results'];
      return result.map((json) => Detail.fromJson(json)).toList();
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
  }

  @override
  Future<List<Detail>> getUpcomingMovie() async {
    List result;
    try {
      final response = await get(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1');
      result = (jsonDecode(response.body))['results'];
      return result.map((json) => Detail.fromJson(json)).toList();
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
  }
}
