import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/selected_container.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class BillDetails extends StatelessWidget {
  const BillDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: ScreenLayout(
        dynamicWidget: Padding(
          padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, top: 66.h),
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
                        text: 'Bill Details',
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
        dynamicWidget2: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.0.w, top: 25.h, bottom: 10.h),
                child: Row(
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
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Youtube Premium',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextWidget(
                            text: 'feb 28,2002',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                child: SizedBox(
                  height: 110.h,
                  child: Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(height: 30.h),
                    TextWidget(
                      text: 'Select payment method',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    SelectedContainer(
                      index: 1,
                      text: 'Debit Card ',

                      icon: Icons.credit_card_sharp,
                    ),
                    SizedBox(height: 10.h),
                    SelectedContainer(
                      index: 1,
                      text: 'Pay Pal ',

                      icon: Icons.paypal,
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0.h),
                      child: CustomButtonWidget(
                        buttonName: 'Pay Now',
                        onPressed: () {
                          context.go(Path.billpayment);
                        },
                        textStyle: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: theme.textTheme.displayMedium!.color!,
                        ),
                      ),
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
