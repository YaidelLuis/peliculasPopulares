import 'package:flutter/material.dart';
import 'package:peliculas_populares/api/api.dart';
import 'package:peliculas_populares/models/pelicula.dart';
import 'package:peliculas_populares/widgets/popular_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pelicula>> popularPeliculas;
  @override
  void initState() {
    super.initState();
    popularPeliculas = Api().getPopularPeliculas();
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
                child: FutureBuilder(
                    future: popularPeliculas,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return PopularSlider(
                          snapshot: snapshot,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              SizedBox(
                child: Center(child: Container()),
              ),
              const Text("yaidel"),
            ],
          ),
        ),
      ),
    );
  }
}
