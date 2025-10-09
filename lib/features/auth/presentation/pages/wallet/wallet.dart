import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class Wallet extends StatelessWidget {
  const Wallet({super.key});

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
                        text: 'Wallet',
                        style: TextStyle(
                          color: theme.textTheme.displayMedium!.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
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
            SizedBox(height: 50),
            TextWidget(
              text: 'Total Balance',
              style: TextStyle(
                color: theme.textTheme.titleSmall!.color,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10.h),
            TextWidget(
              text: '\$1234.0',
              style: TextStyle(
                color: theme.textTheme.displaySmall!.color,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 80),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.add, color: theme.primaryColor),
                  ),
                  SizedBox(width: 30.w),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.qr_code, color: theme.primaryColor),
                  ),
                  SizedBox(width: 30.w),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: theme.primaryColor),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(Icons.send, color: theme.primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.w),
            CupertinoSlidingSegmentedControl<int>(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 10,
                horizontal: 50,
              ),
              children: const <int, Widget>{
                0: Text('Transactions'),
                1: Text('Upcoming Bills'),
              },
              // groupValue: _slidingValue,
              onValueChanged: (int? newValue) {
                if (newValue != null) {
                  // setState(() {
                  //   _slidingValue = newValue;
                  // });
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
