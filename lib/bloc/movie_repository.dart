import 'package:peliculas_populares/models/pelicula.dart';

import 'movie_provider.dart';

class MovieRepository {
  final MovieProvider provider;

  MovieRepository({this.provider = const MovieProvider()});

  Future<List<Pelicula>> getPopularPeliculas() => provider.getPopularPeliculas();
}