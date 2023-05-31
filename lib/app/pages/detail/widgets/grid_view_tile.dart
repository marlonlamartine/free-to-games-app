// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:games_free/app/core/ui/styles/text_styles.dart';

class GridViewTile extends StatelessWidget {
  /*final String titleRight;
  final String textRight;
  final String titleLeft;
  final String textLeft;
  const GridViewTile({
    super.key,
    required this.titleRight,
    required this.textRight,
    required this.titleLeft,
    required this.textLeft,
  });*/
  final String titleTop;
  final String textTop;
  final String titleMid;
  final String textMid;
  final String? titleBot;
  final String? textBot;

  const GridViewTile(
      {super.key,
      required this.titleTop,
      required this.textTop,
      required this.titleMid,
      required this.textMid,
      this.titleBot,
      this.textBot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleTop,
                style: context.textStyles.textComment,
              ),
              const SizedBox(height: 5),
              Text(
                textTop,
                style: context.textStyles.textComment
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleMid,
                style: context.textStyles.textComment,
              ),
              const SizedBox(height: 5),
              Text(
                textMid,
                style: context.textStyles.textComment
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleBot ?? '',
                style: context.textStyles.textComment,
              ),
              const SizedBox(height: 5),
              Text(
                textBot ?? '',
                style: context.textStyles.textComment
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
