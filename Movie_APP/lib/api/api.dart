import 'dart:convert';

import 'package:MoviesApp/Models/movie.dart';
import 'package:MoviesApp/contants.dart';
import 'package:http/http.dart' as http;

class API {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJSON(movie)).toList();
    } else {
      throw Exception("Something Happened");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJSON(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJSON(movie)).toList();
    } else {
      throw Exception('Something happened');
    }
  }
}