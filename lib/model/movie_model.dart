class Movie {
  final String imageUrl;
  final String title;
  final String? runtime; // how long this movie is (in minute)

  Movie({
    required this.imageUrl,
    required this.title,
    this.runtime,
  });
}
