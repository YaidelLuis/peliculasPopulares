import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas_populares/bloc/movie_bloc.dart';
import 'package:peliculas_populares/screens/details_screen.dart';
import 'package:peliculas_populares/widgets/popular_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MovieBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = context.read<MovieBloc>();
    bloc.add(LoadingMovieEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("PELICULAS MAS POPULARES"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: BlocBuilder<MovieBloc, MovieState>(
                  buildWhen: (previous, current) {
                    if (current is InMovieDetailsState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            details: current.details,
                            onBack: () {
                              bloc.add(LoadingMovieEvent());
                            },
                          ),
                        ),
                      );
                      return false;
                    }
                    return true;
                  },
                  builder: (BuildContext context, MovieState state) {
                    if (state is ErrorMovieState) {
                      return Center(child: Text(state.message));
                    } else if (state is LoadingMovieState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is InMovieState) {
                      return PopularSlider(
                        snapshot: state.movies,
                      );
                    }
                    return Container();
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 100),
                child: Text(
                  "Listado de las películas más populares del sitio The Movie DB (TMBD). Toque su película favorita y acceda a una breve descripción.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
