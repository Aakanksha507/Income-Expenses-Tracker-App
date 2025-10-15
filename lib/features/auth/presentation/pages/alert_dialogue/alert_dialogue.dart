import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/alert_dialogue/alert_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_elevated_button.dart';

class AlertDialogueWidget extends ConsumerWidget {
  final void Function()? onPressed;
  const AlertDialogueWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(showLoadingState);

    return AlertDialog(
      title: Text('Alert Dialog'),
      content: Text('This is alert dialog.'),
      actions: [
        CustomElevatedButton(
          onPressed: isLoading
              ? null
              : () async {
                  ref.read(showLoadingState.notifier).state = true;
                  await Future.delayed(Duration(seconds: 2));
                  ref.read(showLoadingState.notifier).state = false;

                  context.pop();
                },
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 1),
                )
              : Text('ok', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
