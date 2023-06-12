import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:games_free/app/bloc/detail/detail_state.dart';
import 'package:games_free/app/repositories/games_repository.dart';

class DetailCubit extends Cubit<DetailState> {
  final GamesRepository _repository;
  DetailCubit(this._repository) : super(DetailState.initial());

  Future<void> getProductById(int id) async {
    try {
      emit(state.copyWith(status: DetailStateStatus.loading));
      final detail = await _repository.getGameById(id);
      emit(
          state.copyWith(status: DetailStateStatus.loaded, gameDetail: detail));
    } catch (e, s) {
      log('Erro ao buscar jogo', stackTrace: s);
      emit(
        state.copyWith(
          status: DetailStateStatus.error,
          errorMessage: 'Erro ao buscar jogo \n$e \n$s',
        ),
      );
    }
  }
}
