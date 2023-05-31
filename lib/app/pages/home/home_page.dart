import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:games_free/app/bloc/home/home_cubit.dart';
import 'package:games_free/app/bloc/home/home_state.dart';
import 'package:games_free/app/core/ui/constants/constants.dart';
import 'package:games_free/app/core/ui/widgets/game_tile.dart';
import 'package:games_free/app/pages/detail/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<HomeCubit>();
      cubit.loadGames();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home Page'),
        backgroundColor: kBackgroundColor,
        elevation: 0,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStateStatus.initial ||
              state.status == HomeStateStatus.loading) {
            return const Center(
              child: SpinKitSpinningLines(
                color: Colors.blue,
                size: 30,
              ),
            );
          } else if (state.status == HomeStateStatus.error) {
            return Center(
              child: Text(state.errorMessage ?? 'deu erro'),
            );
          } else if (state.status == HomeStateStatus.loaded) {
            final games = state.games;
            return SizedBox(
              child: ListView.builder(
                itemCount: games.length,
                itemBuilder: (context, index) {
                  return GameTile(
                    id: games[index].id,
                    title: games[index].title,
                    genre: games[index].genre,
                    thumbnail: games[index].thumbnail,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(id: games[index].id),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Text(state.toString()),
            );
          }
        },
      ),
    );
  }
}
