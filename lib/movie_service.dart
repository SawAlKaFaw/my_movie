// services/movie_service.dart


import 'package:dio/dio.dart';

import 'movie.dart';

class MovieService {
  final Dio _dio = Dio();

  // Function to fetch movies from the API
  Future<List<Movie>> fetchMovies(int page) async {
    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/movie/now_playing',
        queryParameters: {
          'api_key': '8c396d3bd56394d191afe324c1df9cbf',
          'language': 'en-US',
          'page': page,
        },
      );

      // Extracting movie data from the response
      List<dynamic> movieJsonList = response.data['results'];
      return movieJsonList.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching movies: $e');
      throw Exception('Failed to load movies');
    }
  }
}
