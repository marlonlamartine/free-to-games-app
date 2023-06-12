import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:games_free/app/bloc/home/home_cubit.dart';
import 'package:games_free/app/bloc/home/home_state.dart';
import 'package:games_free/app/core/ui/constants/constants.dart';
import 'package:games_free/app/core/ui/styles/text_styles.dart';
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
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kBackgroundCardColor,
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIconColor: kFontColor,
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: 'Procurar game',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kFontColor,
              ),
            ),
          ),
        ),
        backgroundColor: kBackgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/login');
            },
            icon: const Icon(
              Icons.person,
              color: kFontColor,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star,
              color: kFontColor,
            ),
          ),
        ],
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kBackgroundCardColor,
                ),
                child: Text(
                  'Infelizmente, o jogo procurado não consta mais na nossa base de dados',
                  style: context.textStyles.textGameTitle,
                ),
              ),
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
