// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:games_free/app/models/game_detail.dart';

enum DetailStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class DetailState {
  final DetailStateStatus status;
  final GameDetail? gameDetail;
  final String? errorMessage;

  DetailState({
    required this.status,
    required this.gameDetail,
    this.errorMessage,
  });

  DetailState.initial()
      : status = DetailStateStatus.initial,
        gameDetail = null,
        errorMessage = null;

  DetailState copyWith(
      {final DetailStateStatus? status,
      final GameDetail? gameDetail,
      final String? errorMessage}) {
    return DetailState(
      status: status ?? this.status,
      gameDetail: gameDetail ?? this.gameDetail,
      errorMessage: errorMessage,
    );
  }
}
