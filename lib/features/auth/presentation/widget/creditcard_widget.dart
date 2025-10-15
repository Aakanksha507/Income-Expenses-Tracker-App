import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CreditcardWidget extends StatelessWidget {
  final double income;
  final double expenses;
  final double balance;

  const CreditcardWidget({
    super.key,
    required this.income,
    required this.expenses,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        height: 201.h,
        width: 374.w,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 25.0.h, left: 20.0.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: 'Total Balance',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: theme.textTheme.displayMedium!.color!,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: theme.iconTheme.color,
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz),
                ],
              ),

              TextWidget(
                text: '\$${balance.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.displayMedium!.color!,
                ),
              ),
              SizedBox(height: 25.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/arrow.svg'),
                          SizedBox(width: 5),
                          TextWidget(
                            text: 'Income',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: theme.textTheme.displayMedium!.color!,
                            ),
                          ),
                        ],
                      ),
                      TextWidget(
                        text: '\$${income.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.displayMedium!.color!,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Transform.rotate(
                            angle: pi,
                            child: SvgPicture.asset('assets/images/arrow.svg'),
                          ),
                          SizedBox(width: 5.h),
                          TextWidget(
                            text: 'Expenses',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: theme.textTheme.displayMedium!.color!,
                            ),
                          ),
                        ],
                      ),
                      TextWidget(
                        text: '\$${expenses.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.displayMedium!.color!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
