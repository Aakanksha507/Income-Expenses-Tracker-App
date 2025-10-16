// sort_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/hive_data_provider.dart';

import '../data/enum.dart';
import '../data/model/expenses.dart';

enum SortOrder { ascending, descending }

class SortedExpensesNotifier extends StateNotifier<List<Expense>> {
  final List<Expense> allExpenses;
  SortOrder _sortOrder = SortOrder.ascending;

  SortedExpensesNotifier(this.allExpenses) : super([]) {
    _filterAndSort();
  }

  void _filterAndSort() {
    final filtered = allExpenses.where((expense) {
      final category = ExpensesCategory.values.firstWhere(
        (e) => e.name.toLowerCase() == expense.category.toLowerCase(),
        orElse: () => ExpensesCategory.youtube,
      );
      return !category.isIncome;
    }).toList();

    filtered.sort((a, b) {
      final aAmount = double.tryParse(a.amount) ?? 0;
      final bAmount = double.tryParse(b.amount) ?? 0;
      return _sortOrder == SortOrder.ascending
          ? aAmount.compareTo(bAmount)
          : bAmount.compareTo(aAmount);
    });

    state = filtered;
  }

  void toggleSortOrder() {
    _sortOrder = _sortOrder == SortOrder.ascending
        ? SortOrder.descending
        : SortOrder.ascending;
    _filterAndSort();
  }
}

final sortedExpensesProvider =
    StateNotifierProvider<SortedExpensesNotifier, List<Expense>>((ref) {
      final allExpenses = ref.watch(expensesBoxProvider).values.toList();
      return SortedExpensesNotifier(allExpenses);
    });
