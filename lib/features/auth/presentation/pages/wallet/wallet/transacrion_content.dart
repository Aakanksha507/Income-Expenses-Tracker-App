import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/hive_data_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class TransactionContent extends ConsumerWidget {
  const TransactionContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesBox = ref.watch(expensesBoxProvider);
    final allExpenses = expensesBox.values.toList();
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: allExpenses.length,
      itemBuilder: (context, index) {
        final expense = allExpenses[index];
        return ListTile(
          leading: expense.categoryImage != null
              ? Image.asset(expense.categoryImage!, width: 40, height: 40)
              : Icon(Icons.image_not_supported),

          title: TextWidget(
            text: expense.category,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          subtitle: TextWidget(
            text: expense.date,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300),
          ),
          trailing: Text(
            '\$${expense.amount}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        );
      },
    );
  }
}
