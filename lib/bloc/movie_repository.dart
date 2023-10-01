import 'package:peliculas_populares/models/details.dart';
import 'package:peliculas_populares/models/movie.dart';
import 'movie_provider.dart';

class MovieRepository {
  final MovieProvider provider;

  MovieRepository({this.provider = const MovieProvider()});

  Future<List<Movie>> getPopularPeliculas() => provider.getPopularPeliculas();
  Future<Details> getMovieDetails(int id) => provider.getMovieDetails(id);
}
