import 'dart:convert';

import 'package:peliculas_populares/models/pelicula.dart';
import 'package:peliculas_populares/widgets/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  Future<List<Pelicula>> getPopularPeliculas() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((pelicula) => Pelicula.fromJson(pelicula)).toList();
    } else {
      throw Exception('No data');
    }
  }
}
