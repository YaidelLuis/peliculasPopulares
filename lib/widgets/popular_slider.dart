import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_populares/models/pelicula.dart';
import 'package:peliculas_populares/screens/details_screen.dart';
import 'package:peliculas_populares/widgets/constants.dart';

class PopularSlider extends StatelessWidget {
  const PopularSlider({
    super.key,
    required this.snapshot,
  });

  final List<Pelicula> snapshot;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: snapshot.length,
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: const Duration(seconds: 1),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      pelicula: snapshot[itemIndex],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 400,
                  width: 300,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot[itemIndex].posterPath}',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
