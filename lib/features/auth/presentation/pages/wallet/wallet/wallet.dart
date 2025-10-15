import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/wallet/transacrion_content.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/wallet/upcoming_content.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/hive_data_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/total_balance.dart';

class Wallet extends ConsumerWidget {
  const Wallet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final expensesBox = ref.watch(expensesBoxProvider);
    final allExpenses = expensesBox.values.toList();
    final totals = calculateTotals(allExpenses);

    final balance = totals['balance']!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Center(
                child: Column(
                  children: [
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
                      text: '\$${balance}',
                      style: TextStyle(
                        color: theme.textTheme.displaySmall!.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 80),
                child: Row(
                  children: [
                    _buildCircleIcon(
                      Icons.add,
                      theme,
                      text: 'Add',
                      ontap: () {
                        context.go(Path.addexpense);
                      },
                    ),

                    SizedBox(width: 30.w),
                    _buildCircleIcon(
                      Icons.qr_code,
                      theme,
                      text: 'Pay',
                      ontap: () {
                        context.go(Path.connect);
                      },
                    ),
                    SizedBox(width: 30.w),
                    _buildCircleIcon(
                      Icons.send,
                      theme,
                      rotationAngle: 320 * 3.1415926535 / 180,
                      text: 'Send',
                      ontap: () {
                        context.go(Path.billdetails);
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              /// TabBar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  height: 48,
                  width: 374,
                  decoration: BoxDecoration(
                    color: Color(0xffF4F6F6),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: theme.textTheme.titleMedium!.color,
                    unselectedLabelColor: theme.textTheme.titleMedium!.color,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                    padding: EdgeInsets.all(4),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    tabs: [
                      Tab(text: 'Transactions'),
                      Tab(text: 'Upcoming Bills'),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: TabBarView(
                  children: [TransactionContent(), UpcomingContent()],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }

  Widget _buildCircleIcon(
    IconData icon,
    ThemeData theme, {
    double rotationAngle = 0,
    String text = '',
    void Function()? ontap,
  }) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: theme.primaryColor),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(50),
              splashColor: Colors.grey[200],
              onTap: ontap,
              child: Center(
                child: Transform.rotate(
                  angle: rotationAngle,
                  child: Icon(icon, color: theme.primaryColor),
                ),
              ),
            ),
          ),
        ),
        TextWidget(
          text: text,
          style: TextStyle(color: theme.textTheme.displaySmall!.color),
        ),
      ],
    );
  }
}
