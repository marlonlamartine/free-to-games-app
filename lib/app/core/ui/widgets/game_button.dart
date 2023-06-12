import 'package:flutter/material.dart';
import 'package:games_free/app/core/ui/styles/text_styles.dart';

class GameButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final IconData? icon;
  final ButtonStyle style;

  const GameButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.width,
    required this.height,
    this.icon,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              label,
              style: context.textStyles.textButton,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
