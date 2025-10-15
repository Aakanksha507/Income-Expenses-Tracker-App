import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              ? Image.asset(expense.categoryImage!, width: 50.w, height: 50.h)
              : const Icon(Icons.image_not_supported),

          title: TextWidget(
            text: expense.category,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          subtitle: TextWidget(
            text: expense.date,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
          trailing: const CustomElevatedButton(),
        );
      },
    );
  }
}
