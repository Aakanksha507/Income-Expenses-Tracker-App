import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CreditcardWidget extends StatelessWidget {
  final String? cardNumber;
  const CreditcardWidget({super.key, this.cardNumber});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: 201.h,
        width: 374.w,
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 20.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                          fontSize: 16,
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
                text: '\$123',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.displayMedium!.color!,
                ),
              ),
              SizedBox(height: 25),
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: theme.textTheme.displayMedium!.color!,
                            ),
                          ),
                        ],
                      ),
                      TextWidget(
                        text: '\$123',
                        style: TextStyle(
                          fontSize: 20,
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
                          SizedBox(width: 5),
                          TextWidget(
                            text: 'Expenses',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: theme.textTheme.displayMedium!.color!,
                            ),
                          ),
                        ],
                      ),
                      TextWidget(
                        text: '\$123',
                        style: TextStyle(
                          fontSize: 20,
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
