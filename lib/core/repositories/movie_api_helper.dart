import 'dart:convert';
import 'dart:io';

import 'package:GrubNet/core/model/movie.dart';
import 'package:http/http.dart';

import '../../api_key.dart';

const genreMovieUrl =
    'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US';
const popularMovieUrl =
    'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';
const upcomingMovieUrl =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1';
const nowPlayMovieUrl =
    'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1';
const apiUrl =
    'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&page=1&include_adult=false&query=love&region=ID';
const topRatedUrl =
    'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';

abstract class Services {
  Future<List<Detail>> getSearchMovie();
  Future<List<Genre>> getGenreMovie();
  Future<List<Detail>> getPopularMovie();
  Future<List<Detail>> getNowPlayMovie();
  Future<List<Detail>> getUpcomingMovie();
  Future<List<Detail>> getTopRatedMovie();
  Future<List<Detail>> getSimiliarMovie(int movieId);
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
      final response = await get(genreMovieUrl,
          headers: {'content-type': 'application/json;charset=utf-8'});
      if (response.statusCode == 200) {
        result = (jsonDecode(response.body))['genres'];
        return result.map((json) => Genre.fromJson(json)).toList();
      }
      print(jsonDecode(response.body)['status_message']);
      throw HttpException(response.body);
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
  }

  @override
  Future<List<Detail>> getPopularMovie() async {
    List result;
    try {
      final response = await get(popularMovieUrl,
          headers: {'content-type': 'application/json;charset=utf-8'});
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
  Future<List<Detail>> getNowPlayMovie() async {
    List result;
    try {
      final response = await get(nowPlayMovieUrl,
          headers: {'content-type': 'application/json;charset=utf-8'});
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
      final response = await get(upcomingMovieUrl,
          headers: {'content-type': 'application/json;charset=utf-8'});
      result = (jsonDecode(response.body))['results'];
      return result.map((json) => Detail.fromJson(json)).toList();
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
  }

  @override
  Future<List<Detail>> getTopRatedMovie() async {
    List result;
    try {
      final response = await get(topRatedUrl,
          headers: {'content-type': 'application/json;charset=utf-8'});
      result = (jsonDecode(response.body))['results'];
      return result.map((json) => Detail.fromJson(json)).toList();
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
  }

  @override
  Future<List<Detail>> getSimiliarMovie(int movieId) async {
    List result;
    try {
      final response = await get(
          'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=$apiKey&language=en-US&page=1',
          headers: {'content-type': 'application/json;charset=utf-8'});
      result = (jsonDecode(response.body))['results'];
      return result.map((json) => Detail.fromJson(json)).toList();
    } on HttpException catch (e) {
      print(e.message);
      throw e.message;
    }
  }
}
