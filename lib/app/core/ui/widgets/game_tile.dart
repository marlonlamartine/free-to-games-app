// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:games_free/app/core/ui/constants/constants.dart';
import 'package:games_free/app/core/ui/styles/text_styles.dart';

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
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: kBackgroundCardColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Hero(
                  tag: widget.thumbnail,
                  child: Image.network(
                    widget.thumbnail,
                    height: 100,
                    width: 100,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.textGameTitle,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kFontColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(
                          child: Text(
                            widget.genre,
                            style: context.textStyles.textComment.copyWith(
                              color: kBackgroundCardColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
