import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/wallet/connect_wallet/card.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/seletec_container_screen.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class ConnectWallet extends StatelessWidget {
  const ConnectWallet({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                          text: 'Connect Wallet',
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
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 25,
                ),
                child: Container(
                  height: 48,
                  width: 374,
                  decoration: BoxDecoration(
                    color: const Color(0xffF4F6F6),
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: theme.textTheme.titleMedium!.color,
                    unselectedLabelColor: theme.textTheme.titleMedium!.color,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                    padding: const EdgeInsets.all(4),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    tabs: const [
                      Tab(text: 'Cards'),
                      Tab(text: 'Account'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Tab 1
                    CardWallet(),
                    SelectableContainersScreen(),
                    // Account(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: CustomNavigationBar(),
      ),
    );
  }
}
