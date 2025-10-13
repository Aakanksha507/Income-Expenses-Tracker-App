import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/expenses_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class DropdownFieldWidget extends ConsumerWidget {
  final String? labelText;
  final String? hintText;
  final String? Function(ExpensesCategory?)? validator;

  const DropdownFieldWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty) ...[
          TextWidget(
            text: labelText!,
            style: TextStyle(
              color: theme.textTheme.titleSmall?.color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8.h),
        ] else ...[
          SizedBox(height: 2.h),
        ],

        DropdownButtonFormField<ExpensesCategory>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          value: selectedCategory,
          onChanged: (ExpensesCategory? newValue) {
            ref.read(selectedCategoryProvider.notifier).state = newValue;
          },
          validator:
              validator ??
              (value) {
                if (value == null) {
                  return 'This field is required';
                }
                return null;
              },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFFCACACA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            hintText: hintText ?? 'Select category',
            hintStyle: TextStyle(
              color: Color(0xFFCACACA),
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
          ),
          items: ExpensesCategory.values
              .where((category) => category != ExpensesCategory.upWork)
              .map((category) {
                return DropdownMenuItem<ExpensesCategory>(
                  value: category,
                  child: Row(
                    children: [
                      Image.asset(
                        category.getAssets(context),
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      TextWidget(
                        text: category.label(context),
                        style: TextStyle(
                          color: theme.textTheme.displaySmall?.color,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              })
              .toList(),
        ),
      ],
    );
  }
}
