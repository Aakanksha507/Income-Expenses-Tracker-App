import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';

final selectedCategoryProvider = StateProvider<ExpensesCategory?>(
  (ref) => null,
);

final expenseFormProvider =
    StateNotifierProvider<ExpenseFormNotifier, ExpenseFormState>((ref) {
      return ExpenseFormNotifier();
    });

class ExpenseFormState {
  final ExpensesCategory? selectedCategory;
  final ExpensesCategory? selectedCategoryImg;
  final String? amount;
  final String? date;
  final String? invoice;

  const ExpenseFormState({
    this.selectedCategory,
    this.amount,
    this.date,
    this.invoice,
    this.selectedCategoryImg,
  });

  ExpenseFormState copyWith({
    ExpensesCategory? selectedCategory,
    ExpensesCategory? selectedCategoryImg,
    String? amount,
    String? date,
    String? invoice,
  }) {
    return ExpenseFormState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedCategoryImg: selectedCategoryImg ?? this.selectedCategoryImg,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      invoice: invoice ?? this.invoice,
    );
  }
}

class ExpenseFormNotifier extends StateNotifier<ExpenseFormState> {
  ExpenseFormNotifier() : super(const ExpenseFormState());

  void setCategory(ExpensesCategory? category) {
    state = state.copyWith(selectedCategory: category);
  }

  void setCategoryImg(ExpensesCategory? selectedCategoryImg) {
    state = state.copyWith(selectedCategoryImg: selectedCategoryImg);
  }

  void setAmount(String amount) {
    state = state.copyWith(amount: amount);
  }

  void setDate(String date) {
    state = state.copyWith(date: date);
  }

  void setInvoice(String invoice) {
    state = state.copyWith(invoice: invoice);
  }

  void clearForm() {
    state = const ExpenseFormState();
  }
}
