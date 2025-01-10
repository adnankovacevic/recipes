import 'package:flutter/material.dart';
import 'package:recipes/themes/color_palettes.dart';

class StandardButton {
  StandardButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final IconData? icon;
  final void Function() onPressed;
  ButtonStyle buttonStyle = ButtonStyle(
    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(vertical: 16),
    ),
    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    backgroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorPalettes.black.withValues(alpha: 0.4);
        }
        return ColorPalettes.primary;
      },
    ),
  );

  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon) : null,
      label: Text(text),
      style: buttonStyle,
    );
  }
}
