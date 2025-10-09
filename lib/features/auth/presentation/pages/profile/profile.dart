import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_snack_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          // Custom AppBar Header
          AppBarHeader(
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
                            text: 'Profile',
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
                      // Positioned(
                      //   top: -185,
                      //   left: 147,
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         height: 100.w,
                      //         width: 100.w,
                      //         decoration: const BoxDecoration(
                      //           color: Colors.red,
                      //           shape: BoxShape.circle,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 10.h),
          Text(
            'Enjelin Morgeana',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: theme.textTheme.displaySmall!.color,
            ),
          ),
          Text(
            '@enjelin_morgeana',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.bodyLarge!.color,
            ),
          ),

          SizedBox(height: 20.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: const [
                _ProfileTile(
                  img: 'assets/images/diamond.svg',
                  label: 'Invite Friends',
                ),
                Divider(color: Colors.grey),
                _ProfileTile(
                  img: 'assets/images/person.svg',
                  label: 'Account info',
                ),
                _ProfileTile(
                  img: 'assets/images/pp.svg',
                  label: 'Personal profile',
                ),
                _ProfileTile(
                  img: 'assets/images/msil.svg',
                  label: 'Message center',
                ),
                _ProfileTile(
                  img: 'assets/images/shield.svg',
                  label: 'Login and security',
                ),
                _ProfileTile(
                  img: 'assets/images/lock.svg',
                  label: 'Data and privacy',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  final String img;
  final String label;

  const _ProfileTile({required this.img, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(img),
      title: Text(label, style: TextStyle(fontSize: 16.sp)),
      onTap: () {
        CustomSnackBar.show(context, 'Coming Soon');
      },
    );
  }
}
