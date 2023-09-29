part of 'movie_bloc.dart';
abstract class MovieEvent {

  Future<void> handleEvent(Emitter emit, MovieBloc bloc);
}

class LoadingMovieEvent extends MovieEvent{
  @override
  Future<void> handleEvent(emit, bloc) async {
    emit(LoadingMovieState());
    try {
      var movies = await bloc.repository.getPopularPeliculas();
      emit(InMovieState(movies: movies));
    } catch (e) {
      emit(ErrorMovieState(message: e.toString()));
    }
  }
}