import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertDialogueWidget extends ConsumerWidget {
  final void Function()? onPressed;

  const AlertDialogueWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('Alert Dialog'),
      content: Text('This is an alert dialog.'),
      actions: [
        TextButton(
          onPressed:
              onPressed ??
              () {
                Navigator.of(context).pop();
              },
          child: Text('OK'),
        ),
      ],
    );
  }
}
