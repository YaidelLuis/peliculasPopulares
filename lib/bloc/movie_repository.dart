import 'package:peliculas_populares/models/details.dart';
import 'package:peliculas_populares/models/movie.dart';
import 'movie_provider.dart';

class MovieRepository {
  final MovieProvider provider;

  MovieRepository({this.provider = const MovieProvider()});

  Future<List<Movie>> getPopularMovies() => provider.getPopularMovies();
  Future<Details> getMovieDetails(int id) => provider.getMovieDetails(id);
}
