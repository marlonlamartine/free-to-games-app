import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Game {
  final int id;
  final String title;
  final String thumbnail;
  final String shortDescription;
  final String gameUrl;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String releaseDate;
  final String freetogameProfileUrl;
  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.shortDescription,
    required this.gameUrl,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.releaseDate,
    required this.freetogameProfileUrl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'thumbnail': thumbnail,
      'short_description': shortDescription,
      'game_url': gameUrl,
      'genre': genre,
      'platform': platform,
      'publisher': publisher,
      'developer': developer,
      'release_date': releaseDate,
      'freetogame_profile_url': freetogameProfileUrl,
    };
  }

  factory Game.fromMap(Map<String, dynamic> map) {
    return Game(
      id: map['id'] as int,
      title: map['title'] as String,
      thumbnail: map['thumbnail'] as String,
      shortDescription: map['short_description'] as String,
      gameUrl: map['game_url'] as String,
      genre: map['genre'] as String,
      platform: map['platform'] as String,
      publisher: map['publisher'] as String,
      developer: map['developer'] as String,
      releaseDate: map['release_date'] as String,
      freetogameProfileUrl: map['freetogame_profile_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Game.fromJson(String source) =>
      Game.fromMap(json.decode(source) as Map<String, dynamic>);
}
