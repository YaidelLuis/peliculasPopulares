import 'dart:convert';
import 'package:peliculas_populares/models/details.dart';
import 'package:peliculas_populares/models/movie.dart';
import 'package:peliculas_populares/widgets/constants.dart';
import 'package:http/http.dart' as http;

class Api {
  const Api();

  final _popularUrl =
      '${Constants.baseURL}movie/popular?api_key=${Constants.apiKey}';

  Future<List<Movie>> getPopularMovie() async {
    final response = await http.get(Uri.parse(_popularUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((pelicula) => Movie.fromJson(pelicula)).toList();
    } else {
      throw Exception('No data');
    }
  }

  Future<Details> getMovieDetails(int id) async {
    final detailsUrl =
        '${Constants.baseURL}movie/$id?api_key=${Constants.apiKey}';
    final response = await http.get(Uri.parse(detailsUrl));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body);
      return Details.fromJson(decodeData);
    } else {
      throw Exception('No data');
    }
  }
}
