// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:games_free/app/models/game.dart';

enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState {
  final HomeStateStatus status;
  final List<Game> games;
  final String? errorMessage;

  HomeState({
    required this.status,
    required this.games,
    this.errorMessage,
  });

  HomeState.initial()
      : status = HomeStateStatus.initial,
        games = [],
        errorMessage = null;

  HomeState copyWith({
    HomeStateStatus? status,
    List<Game>? games,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      games: games ?? this.games,
      errorMessage: errorMessage,
    );
  }
}
