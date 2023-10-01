import 'dart:convert';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:peliculas_populares/bloc/movie_bloc.dart';
import 'package:peliculas_populares/bloc/movie_repository.dart';
import 'package:peliculas_populares/models/details.dart';
import 'package:peliculas_populares/models/movie.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  List<Movie> movies = [];
  late MovieRepository repository;
  late Details details;

  setUpAll(() {
    repository = MockMovieRepository();
    details = Details(
        originalTitle: 'asdasdasd',
        overview: 'adasdadasd',
        releaseDate: 'adasdasd',
        voteAverage: 6.4,
        posterPath: 'ssdsd',
        genres: [Genre(id: 1, name: 'aqwew'), Genre(id: 2, name: 'ewrwerw')]);
    movies = [
      Movie(id: 1, title: 'XXX', backDropPath: 'asdasd', posterPath: 'asdasd'),
      Movie(id: 2, title: 'YYY', backDropPath: 'qweqe', posterPath: 'retert'),
    ];
  });
  group("pruebas unitarias al bloc movie", () {
    blocTest<MovieBloc, MovieState>(
      'probar cambio de estados cuando se realiza el evento devolver peliculas populares',
      build: () => MovieBloc(repository),
      act: (bloc) {
        when(() => repository.getPopularPeliculas())
            .thenAnswer((_) async => movies);
        bloc.add(LoadingMovieEvent());
      },
      expect: () =>
          <MovieState>[LoadingMovieState(), InMovieState(movies: movies)],
    );

    blocTest<MovieBloc, MovieState>(
      'error',
      build: () => MovieBloc(repository),
      act: (bloc) {
        when(() => repository.getPopularPeliculas())
            .thenThrow((_) => Exception('asdasdasdsd'));
        bloc.add(LoadingMovieEvent());
      },
      expect: () => [LoadingMovieState(), isA<ErrorMovieState>()],
    );

    blocTest<MovieBloc, MovieState>(
      'probar cambio de estados cuando se realiza el evento devolver detalles de peliculas',
      build: () => MovieBloc(repository),
      act: (bloc) {
        when(() => repository.getMovieDetails(2))
            .thenAnswer((_) async => details);
        bloc.add(LoadingMovieDetailsEvent(id: 2));
      },
      expect: () => <MovieState>[
        LoadingMovieState(),
        InMovieDetailsState(details: details)
      ],
    );
  });
}
