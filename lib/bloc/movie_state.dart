part of 'movie_bloc.dart';

class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnMovieState extends MovieState {}

class LoadingMovieState extends MovieState {}

class InMovieState extends MovieState {
  final List<Movie> movies;

  InMovieState({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class InMovieDetailsState extends MovieState {
  final Details details;

  InMovieDetailsState({required this.details});

  @override
  List<Object?> get props => [details];
}

class ErrorMovieState extends MovieState {
  final String message;

  ErrorMovieState({required this.message});

  @override
  List<Object?> get props => [message];
}
