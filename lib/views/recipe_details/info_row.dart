import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({super.key, required this.text, required this.icon});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Icon(
          icon,
          color: ColorPalettes.black.withValues(alpha: 0.4),
        ),
        Text(
          text,
          style: context.textTheme.bodySmall?.transparent,
        ),
      ],
    );
  }
}
