// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GameTile extends StatefulWidget {
  final int id;
  final String title;
  final String genre;
  final String thumbnail;
  final VoidCallback onTap;

  const GameTile({
    Key? key,
    required this.id,
    required this.title,
    required this.genre,
    required this.thumbnail,
    required this.onTap,
  }) : super(key: key);

  @override
  State<GameTile> createState() => _GameTileState();
}

class _GameTileState extends State<GameTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: widget.onTap,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/light.png',
            image: widget.thumbnail,
            height: 150,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
