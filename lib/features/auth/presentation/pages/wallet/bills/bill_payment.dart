import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class BillPayment extends StatelessWidget {
  const BillPayment({super.key});

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
                            Icons.notifications_none_outlined,
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
            Padding(
              padding: EdgeInsets.only(top: 40.0.h, left: 25.w, right: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 80.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0.h,
                      left: 55.w,
                      right: 40.w,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextWidget(
                              text: ' You will pay',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            TextWidget(
                              text: ' Youtube Premium',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: theme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        TextWidget(
                          text: 'for one month with BCA OneKlik',
                          style: TextStyle(fontSize: 16.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
              child: SizedBox(
                height: 110.h,
                child: Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: TextWidget(
                          text: 'price',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: TextWidget(
                          text: '\$13.90',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Column(
                children: [
                  Divider(),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Total',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextWidget(
                        text: '\$13.90',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 180.h),

            CustomButtonWidget(
              buttonName: 'Pay Now',
              onPressed: () {
                context.go(Path.billpayment);
              },
              textStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: theme.textTheme.displayMedium!.color!,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
