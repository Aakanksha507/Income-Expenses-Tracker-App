import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
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

        final category = ExpensesCategory.values.firstWhere(
          (e) => e.name.toLowerCase() == expense.category.toLowerCase(),
          orElse: () => ExpensesCategory.youtube,
        );

        final color = category.amountColor;

        return ListTile(
          leading: expense.categoryImage != null
              ? Image.asset(expense.categoryImage!, width: 50.w, height: 50.h)
              : Icon(Icons.image_not_supported),

          title: TextWidget(
            text: category.label(context),
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: TextWidget(
            text: expense.date,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300),
          ),
          trailing: Text(
            '\$${expense.amount}',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        );
      },
    );
  }
}
