import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_free/app/bloc/detail/detail_cubit.dart';
import 'package:games_free/app/bloc/home/home_cubit.dart';
import 'package:games_free/app/pages/home/home_page.dart';
import 'package:games_free/app/repositories/games_repository.dart';

class GamesFree extends StatefulWidget {
  const GamesFree({super.key});

  @override
  State<GamesFree> createState() => _GamesFreeState();
}

class _GamesFreeState extends State<GamesFree> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(
            GamesRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => DetailCubit(
            GamesRepository(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Free Games',
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
