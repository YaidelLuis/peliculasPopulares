class Movie {
  int id;
  String title;
  String backDropPath;
  String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"] as int,
      title: json["title"],
      backDropPath: json["backdrop_path"],
      posterPath: json["poster_path"],
    );
  }
}
