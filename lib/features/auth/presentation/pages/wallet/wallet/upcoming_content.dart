import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/hive_data_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_elevated_button.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class UpcomingContent extends ConsumerWidget {
  const UpcomingContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesBox = ref.watch(expensesBoxProvider);
    final allExpenses = expensesBox.values.toList();

    final upcomingExpenses = allExpenses.where((expense) {
      final category = ExpensesCategory.values.firstWhere(
        (e) => e.name.toLowerCase() == expense.category.toLowerCase(),
        orElse: () => ExpensesCategory.youtube,
      );

      return !category.isIncome;
    }).toList();

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: upcomingExpenses.length,
      itemBuilder: (context, index) {
        final expense = upcomingExpenses[index];
        return ListTile(
          leading: expense.categoryImage != null
              ? Image.asset(expense.categoryImage!, width: 24, height: 24)
              : const Icon(Icons.image_not_supported),

          title: TextWidget(
            text: expense.category,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: TextWidget(
            text: expense.date,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
          ),
          trailing: const CustomElevatedButton(),
        );
      },
    );
  }
}
