import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import 'movie.dart';
import 'movie_service.dart';



final movieServiceProvider = Provider<MovieService>((ref) => MovieService());

// Movie provider with pagination
final movieProvider = FutureProvider.family<List<Movie>, int>((ref, page) async {
  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.fetchMovies(page); // Fetch movies from the API

  // Save movies to Hive
  var box = Hive.box('movies'); // Access the opened box
  await box.put('page_$page', movies.map((m) => m.toJson()).toList()); // Save movies with the page as the key

  return movies; // Return the fetched movies
});
