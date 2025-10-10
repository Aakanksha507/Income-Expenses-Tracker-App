import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/rectangle_box.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/screen_layout.dart';
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
                      Tab(text: 'Cards'),
                      Tab(text: 'Account'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 65.w),
                          child: Container(
                            height: 183.h,
                            width: 284.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xff027F87), Color(0xff57E3B9)],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 45,
                            right: 45,
                            top: 16,
                          ),
                          child: Container(
                            height: 211.h,
                            width: 324.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage('assets/images/card.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidget(
                                            text: 'Debit',
                                            style: TextStyle(
                                              color: theme
                                                  .textTheme
                                                  .displayMedium!
                                                  .color,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.1,
                                            ),
                                          ),
                                          TextWidget(
                                            text: 'Card',
                                            style: TextStyle(
                                              color: theme
                                                  .textTheme
                                                  .displayMedium!
                                                  .color,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 11.1,
                                            ),
                                          ),
                                        ],
                                      ),
                                      TextWidget(
                                        text: 'Mono',
                                        style: TextStyle(
                                          color: theme
                                              .textTheme
                                              .displayMedium!
                                              .color,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 13.1,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 75),
                                  TextWidget(
                                    text: '1322  222  2222  43343',
                                    style: TextStyle(
                                      letterSpacing: 5,
                                      color:
                                          theme.textTheme.displayMedium!.color,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 13.69,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text: 'Invas Moses'.toUpperCase(),
                                        style: TextStyle(
                                          overflow: TextOverflow.clip,
                                          color: theme
                                              .textTheme
                                              .displayMedium!
                                              .color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.69,
                                        ),
                                      ),
                                      TextWidget(
                                        text: '22/01',
                                        style: TextStyle(
                                          color: theme
                                              .textTheme
                                              .displayMedium!
                                              .color,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13.69,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsetsGeometry.only(
                            top: 238.0,
                            left: 25,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: 'Add your debit Card',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsGeometry.only(right: 60),
                                child: TextWidget(
                                  text:
                                      'This card must be connected to a bank account under your name',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: theme.textTheme.titleMedium!.color,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Column(
                        children: [
                          SelectableContainersScreen(),
                          // SizedBox(height: 10),

                          // CustomButtonWidget(buttonName: 'Next'),
                        ],
                      ),
                    ),
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
