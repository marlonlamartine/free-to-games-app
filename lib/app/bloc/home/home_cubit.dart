import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:games_free/app/bloc/home/home_state.dart';
import 'package:games_free/app/repositories/games_repository.dart';

class HomeCubit extends Cubit<HomeState> {
  final GamesRepository _repository;

  HomeCubit(this._repository) : super(HomeState.initial());

  Future<void> loadGames() async {
    try {
      emit(state.copyWith(status: HomeStateStatus.loading));
      final games = await _repository.getAllGames();
      emit(state.copyWith(status: HomeStateStatus.loaded, games: games));
    } catch (e, s) {
      log('Erro ao buscar jogos', stackTrace: s);
      emit(
        state.copyWith(
            status: HomeStateStatus.error,
            errorMessage: 'Erro ao buscar jogos - \n$e'),
      );
    }
  }
}
