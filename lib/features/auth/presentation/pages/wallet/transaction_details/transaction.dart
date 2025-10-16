import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/Row.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ScreenLayout(
        dynamicWidget: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 66),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          context.go(Path.homepage);
                        },
                        child: const Icon(Icons.arrow_back_ios, size: 20),
                      ),
                      TextWidget(
                        text: 'Transaction Details',
                        style: TextStyle(
                          color: theme.textTheme.displayMedium!.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.sp,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5.sp),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(5.sp),
                          onTap: () {},
                          child: Icon(
                            Icons.more_horiz,
                            color: theme.iconTheme.color,
                            size: 23,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        dynamicWidget2: Column(
          children: [
            SizedBox(height: 25),
            Container(
              height: 80.h,
              width: 80.w,
              decoration: BoxDecoration(
                color: Color(0XFFFAFAFA),
                borderRadius: BorderRadius.circular(50.r),
              ),
              // child: SvgPicture(''),
            ),
            SizedBox(height: 10.h),
            Container(
              height: 25.h,
              width: 80.h,
              decoration: BoxDecoration(
                color: Color(0xffF95B51).withOpacity(0.1),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Center(
                child: TextWidget(
                  text: 'Expense',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 45.h, left: 30.w, right: 30.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Transaction details',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: theme.textTheme.displaySmall!.color,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_up, color: Colors.black),
                    ],
                  ),

                  RowWidget(
                    title: 'Status',
                    secondaryTitle: 'Expenses',
                    color: Colors.red,
                  ),
                  RowWidget(title: 'To', secondaryTitle: 'Claire Jovalski'),
                  RowWidget(title: 'Time', secondaryTitle: '8:15 Am'),
                  RowWidget(title: 'Date', secondaryTitle: 'Feb 28, 2022'),
                  Divider(),

                  RowWidget(title: 'Spending', secondaryTitle: '\$11.99'),
                  RowWidget(title: 'Fee', secondaryTitle: '-\$1.99'),
                  Divider(),
                  RowWidget(title: 'Total', secondaryTitle: '\$13.99'),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0.h),

                    child: CustomButtonWidget(
                      buttonName: 'Download Receipt',
                      border: Border.all(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(30.r),
                      buttonColor: theme.scaffoldBackgroundColor,
                      textStyle: TextStyle(
                        color: theme.textTheme.bodyLarge!.color,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      onPressed: () {
                        context.go(Path.transaction);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
