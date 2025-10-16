import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/Row.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class BillPaymentSuccess extends StatelessWidget {
  const BillPaymentSuccess({super.key});

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
                        text: 'Bill Payment',
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
        dynamicWidget2: Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25.h),
                Container(
                  height: 80.h,
                  width: 80.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffFAFAFA),
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: theme.primaryColor,
                    size: 40,
                  ),
                ),
                SizedBox(height: 15.h),
                TextWidget(
                  text: 'Payment Successfully',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: theme.textTheme.bodyLarge!.color,
                  ),
                ),
                TextWidget(
                  text: 'Youtube Premium',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: theme.textTheme.titleMedium!.color,
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
                        title: 'Payment method',
                        secondaryTitle: 'DebitCard',
                      ),
                      RowWidget(title: 'Status', secondaryTitle: 'Completed'),
                      RowWidget(title: 'Time', secondaryTitle: '8:15 Am'),
                      RowWidget(title: 'Date', secondaryTitle: 'Feb 28, 2022'),

                      RowWidget(
                        title: 'Transaction ID',
                        secondaryTitle: '20309248u93240',
                      ),

                      Divider(),

                      RowWidget(title: 'Price', secondaryTitle: '\$11.99'),
                      RowWidget(title: 'Fee', secondaryTitle: '-\$1.99'),
                      Divider(),
                      RowWidget(title: 'Total', secondaryTitle: '\$13.99'),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0.h),

                        child: CustomButtonWidget(
                          buttonName: 'Share Receipt',
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
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
