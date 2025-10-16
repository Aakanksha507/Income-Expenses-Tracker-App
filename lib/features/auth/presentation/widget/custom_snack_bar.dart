import 'package:flutter/material.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CustomSnackBar {
  static void show(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      final messenger = ScaffoldMessenger.of(context);
      final theme = Theme.of(context);

      messenger
        ..removeCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            backgroundColor: theme.snackBarTheme.backgroundColor,
            content: TextWidget(
              text: message,
              style: TextStyle(
                color: theme.snackBarTheme.actionTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            duration: const Duration(seconds: 2),
          ),
        );
    });
  }
}
