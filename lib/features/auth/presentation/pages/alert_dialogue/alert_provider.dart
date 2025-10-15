import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/alert_dialogue/dilog_state.dart';

final dialogProvider = StateNotifierProvider<DialogNotifier, DialogState>((
  ref,
) {
  return DialogNotifier();
});

class DialogNotifier extends StateNotifier<DialogState> {
  DialogNotifier() : super(DialogState(isShowing: false));

  void showDialog({String? message}) {
    state = state.copyWith(isShowing: true, message: message);
  }

  void hideDialog() {
    state = state.copyWith(isShowing: false, message: null);
  }
}

final showDialogProvider = StateProvider<bool>((ref) => false);
