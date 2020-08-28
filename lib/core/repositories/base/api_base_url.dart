import '../../../api_key.dart';

class Api {
  static String genreMovieUrl =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US';
  static String popularMovieUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey&language=en-US&page=1';
  static String upcomingMovieUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1';
  static String nowPlayMovieUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&language=en-US&page=1';
  static String apiUrl =
      'https://api.themoviedb.org/3/search/movie?api_key=$apiKey&language=en-US&page=1&include_adult=false&query=love&region=ID';
  static String topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey&language=en-US&page=1';
  static String similiarMovieUrl =
      'https://api.themoviedb.org/3/movie/550/similar?api_key=$apiKey&language=en-US&page=1';
}
