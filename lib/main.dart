import 'package:flutter/material.dart';
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
      home: const HomeScreen(),
    );
  }
}
