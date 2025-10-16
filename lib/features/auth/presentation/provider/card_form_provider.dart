import 'package:flutter_riverpod/flutter_riverpod.dart';

class DebitCardForm {
  final String cardName;
  final String cardNumber;
  final String cvc;
  final String date;
  final String zip;
  final String userId;

  const DebitCardForm({
    this.cardName = '',
    this.cardNumber = '',
    this.cvc = '',
    this.date = '',
    this.zip = '',
    this.userId = '',
  });

  DebitCardForm copyWith({
    String? cardName,
    String? cardNumber,
    String? cvc,
    String? date,
    String? zip,
    String? userId,
  }) {
    return DebitCardForm(
      cardName: cardName ?? this.cardName,
      cardNumber: cardNumber ?? this.cardNumber,
      cvc: cvc ?? this.cvc,
      date: date ?? this.date,
      zip: zip ?? this.zip,
      userId: userId ?? this.userId,
    );
  }
}


class CardFormNotifier extends StateNotifier<DebitCardForm> {
  CardFormNotifier() : super(const DebitCardForm());

  void updateCardName(String value) => state = state.copyWith(cardName: value);
  void updateCardNumber(String value) => state = state.copyWith(cardNumber: value);
  void updateCVC(String value) => state = state.copyWith(cvc: value);
  void updateDate(String value) => state = state.copyWith(date: value);
  void updateZip(String value) => state = state.copyWith(zip: value);
  void updateUserId(String value) => state = state.copyWith(userId: value);

  void clear() => state = const DebitCardForm();
}

// Provider
final cardFormProvider = StateNotifierProvider<CardFormNotifier, DebitCardForm>(
  (ref) => CardFormNotifier(),
);
