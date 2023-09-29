import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_populares/bloc/movie_bloc.dart';
import 'package:peliculas_populares/bloc/movie_repository.dart';
import 'package:peliculas_populares/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas populares',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF23272E),
        useMaterial3: true,
      ),
      home: BlocProvider<MovieBloc>(
        create: (_) => MovieBloc(MovieRepository()),
        child: const HomeScreen(),
      ),
    );
  }
}
