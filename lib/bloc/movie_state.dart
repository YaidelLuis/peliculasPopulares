part of 'movie_bloc.dart';

class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class UnMovieState extends MovieState {}

class LoadingMovieState extends MovieState {}

class InMovieState extends MovieState {
  final List<Pelicula> movies;

  InMovieState({required this.movies});

  @override
  List<Object?> get props => [movies];
}

class ErrorMovieState extends MovieState {
  final String message;

  ErrorMovieState({required this.message});

  @override
  List<Object?> get props => [message];
}