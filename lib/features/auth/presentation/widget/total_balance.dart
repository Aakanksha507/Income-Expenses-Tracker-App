import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/expenses.dart';

Map<String, double> calculateTotals(List<Expense> expenses) {
  double income = 0;
  double expense = 0;

  for (var e in expenses) {
    final amount = double.tryParse(e.amount) ?? 0;

    final category = ExpensesCategory.values.firstWhere(
      (c) => c.name.toLowerCase() == e.category.toLowerCase(),
      orElse: () => ExpensesCategory.youtube,
    );

    if (category.isIncome) {
      income += amount;
    } else {
      expense += amount;
    }
  }

  return {'income': income, 'expenses': expense, 'balance': income - expense};
}
