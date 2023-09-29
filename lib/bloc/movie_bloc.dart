import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peliculas_populares/bloc/movie_repository.dart';
import 'package:peliculas_populares/models/pelicula.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository,)
      : super(UnMovieState()) {
    on<LoadingMovieEvent>((event, emit) => event.handleEvent(emit, this));
  }
}