
import 'package:peliculas_populares/api/api.dart';
import 'package:peliculas_populares/models/pelicula.dart';

class MovieProvider {
  final Api api;
  const MovieProvider({this.api = const Api()});

  Future<List<Pelicula>> getPopularPeliculas () => api.getPopularPeliculas();
}