class DialogState {
  final bool isShowing;
  final String? message;

  DialogState({required this.isShowing, this.message});

  DialogState copyWith({bool? isShowing, String? message}) {
    return DialogState(
      isShowing: isShowing ?? this.isShowing,
      message: message ?? this.message,
    );
  }
}
