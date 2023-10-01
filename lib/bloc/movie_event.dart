part of 'movie_bloc.dart';

abstract class MovieEvent {
  Future<void> handleEvent(Emitter emit, MovieBloc bloc);
}

class LoadingMovieEvent extends MovieEvent {
  @override
  Future<void> handleEvent(emit, bloc) async {
    emit(LoadingMovieState());
    try {
      var movies = await bloc.repository.getPopularMovies();
      emit(InMovieState(movies: movies));
    } catch (e) {
      emit(ErrorMovieState(message: e.toString()));
    }
  }
}

class LoadingMovieDetailsEvent extends MovieEvent {
  final int id;

  LoadingMovieDetailsEvent({required this.id});

  @override
  Future<void> handleEvent(emit, bloc) async {
    emit(LoadingMovieState());
    try {
      var details = await bloc.repository.getMovieDetails(id);
      emit(InMovieDetailsState(details: details));
    } catch (e) {
      log(e.toString());
      emit(ErrorMovieState(message: e.toString()));
    }
  }
}
