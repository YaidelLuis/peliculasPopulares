import 'package:peliculas_populares/api/api.dart';
import 'package:peliculas_populares/models/details.dart';
import 'package:peliculas_populares/models/movie.dart';

class MovieProvider {
  final Api api;
  const MovieProvider({this.api = const Api()});

  Future<List<Movie>> getPopularMovies() => api.getPopularMovie();

  Future<Details> getMovieDetails(int id) => api.getMovieDetails(id);
}
