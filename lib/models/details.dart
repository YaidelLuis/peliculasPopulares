class Details {
  String originalTitle;
  String overview;
  List<Genre> genres;
  String releaseDate;
  double voteAverage;
  String posterPath;

  Details({
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.posterPath,
    required this.genres,
  });

  factory Details.fromJson(Map<String, dynamic> json) {
    var genres = json['genres'];
    List<Genre> genreData = [];
    for (var genre in genres) {
      genreData.add(Genre.fromJson(genre));
    }
    return Details(
      originalTitle: json["original_title"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      posterPath: json["poster_path"],
      voteAverage: json["vote_average"] as double,
      genres: genreData,
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'] as int, name: json['name']);
  }
}
