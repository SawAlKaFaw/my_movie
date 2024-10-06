class Movie {
  final String title;
  final String backdropPath;

  Movie({
    required this.title,
    required this.backdropPath,
  });

  // Factory method to create a Movie instance from JSON
  factory Movie.fromJson(Map<String, dynamic> json) {
    String backdrop = json['backdrop_path'] ?? ''; // Ensure backdrop_path is not null
    return Movie(
      title: json['title'],
      backdropPath: backdrop.isNotEmpty
          ? 'https://image.tmdb.org/t/p/original$backdrop' // Correctly construct the URL
          : 'https://via.placeholder.com/150', // Placeholder image if backdrop_path is empty
    );
  }

  // Method to convert a Movie instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'backdrop_path': backdropPath,
    };
  }
}
