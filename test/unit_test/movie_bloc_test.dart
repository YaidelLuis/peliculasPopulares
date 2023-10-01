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
        originalTitle: 'originalTitle',
        overview: 'overview',
        releaseDate: 'releaseDate',
        voteAverage: 6.4,
        posterPath: 'posterPath',
        genres: [Genre(id: 1, name: 'genre1'), Genre(id: 2, name: 'genre2')]);
    movies = [
      Movie(
          id: 1,
          title: 'peli1',
          backDropPath: 'backDropPathPeli1',
          posterPath: 'posterPathPeli1'),
      Movie(
          id: 2,
          title: 'peli2',
          backDropPath: 'backDropPathPeli2',
          posterPath: 'posterPathPeli2'),
    ];
  });
  group("pruebas unitarias al bloc movie", () {
    blocTest<MovieBloc, MovieState>(
      'probar cambio de estados cuando se realiza el evento devolver peliculas populares',
      build: () => MovieBloc(repository),
      act: (bloc) {
        when(() => repository.getPopularMovies())
            .thenAnswer((_) async => movies);
        bloc.add(LoadingMovieEvent());
      },
      expect: () =>
          <MovieState>[LoadingMovieState(), InMovieState(movies: movies)],
    );

    blocTest<MovieBloc, MovieState>(
      'Exception',
      build: () => MovieBloc(repository),
      act: (bloc) {
        when(() => repository.getPopularMovies())
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
