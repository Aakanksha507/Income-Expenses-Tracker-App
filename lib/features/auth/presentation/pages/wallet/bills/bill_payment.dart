import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
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
        dynamicWidget2: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 25, right: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 55, right: 40),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextWidget(
                          text: ' You will pay',
                          style: TextStyle(fontSize: 16),
                        ),
                        TextWidget(
                          text: ' Youtube Premium',
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    TextWidget(
                      text: 'for one month with BCA OneKlik',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
