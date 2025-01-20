import 'package:flutter/material.dart';
import 'package:recipes/themes/text_theme_extensions.dart';

void showBanner(BuildContext context, String message,
    [String title = "Error!"]) {
  showCustomDialog(
    context: context,
    title: title,
    message: message,
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pop(),
        child: Text('OK'),
      ),
    ],
  );
}

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  required List<Widget> actions,
  bool barrierDismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(title, style: context.textTheme.bodyMedium),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text(
                message,
                style: context.textTheme.labelMedium,
              ),
            ],
          ),
        ),
        actions: actions,
      );
    },
  );
}
