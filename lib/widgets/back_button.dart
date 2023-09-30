import 'package:flutter/material.dart';
import 'package:peliculas_populares/bloc/movie_bloc.dart';
import 'package:provider/provider.dart';

class BackBtn extends StatelessWidget {
  final Function() onBack;
  BackBtn({
    super.key,
    required this.onBack,
  });

  late MovieBloc bloc;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: const EdgeInsets.only(top: 16, left: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF23272E),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        onPressed: () {
          onBack.call();
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_rounded,
        ),
      ),
    );
  }
}
