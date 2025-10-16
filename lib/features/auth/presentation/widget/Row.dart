import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class RowWidget extends StatelessWidget {
  final String title;
  final String secondaryTitle;
  final Color? color;
  const RowWidget({
    super.key,
    required this.title,
    required this.secondaryTitle,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: theme.textTheme.titleMedium!.color,
              ),
            ),
            TextWidget(
              text: secondaryTitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: color ?? theme.textTheme.displaySmall!.color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
