import 'package:dio/dio.dart';
import 'package:games_free/app/core/config/api/custom_dio.dart';
import 'package:games_free/app/models/game.dart';
import 'package:games_free/app/models/game_detail.dart';

class GamesRepository {
  final dio = Dio(customDio);

  Future<List<Game>> getAllGames() async {
    try {
      Response response = await dio.get('/games');
      final result =
          (response.data as List).map((e) => Game.fromMap(e)).toList();
      return result;
    } catch (e, s) {
      throw '$e \n$s';
    }
  }

  Future<GameDetail> getGameById(int id) async {
    Response response = await dio.get('/game?id=$id');
    final result = GameDetail.fromJson(response.data);
    return result;
  }
}
