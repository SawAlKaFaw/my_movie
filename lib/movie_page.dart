import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_provider.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  int page = 1; // Track the current page

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(movieProvider(page)); // Watch the movie provider

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies List'),
      ),
      body: movies.when(
        data: (moviesList) {
          return ListView.builder(
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              final movie = moviesList[index];
              return ListTile(
                leading: Image.network(movie.backdropPath), // Display movie image
                title: Text(movie.title), // Display movie title
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()), // Show loading indicator
        error: (error, stackTrace) {
          print('Error: $error'); // Print error to console
          return Center(child: Text('Failed to load movies: $error')); // Show error message
        },
      ),
    );
  }
}
