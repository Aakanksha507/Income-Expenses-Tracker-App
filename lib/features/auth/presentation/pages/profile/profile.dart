import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_snack_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/listtile_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String userName = '';
  String email = '';
  String photoUrl = '';

  @override
  void initState() {
    super.initState();
    var box = Hive.box('userBox');
    setState(() {
      userName = box.get('name', defaultValue: 'User');
      email = box.get('email', defaultValue: 'Email');
      photoUrl = box.get('photoUrl', defaultValue: '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          AppBarHeader(
            dynamicWidget: SizedBox(
              height: 220.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SvgPicture.asset(
                    'assets/images/top_bg.svg',
                    width: double.infinity,
                    height: 180.h,
                    fit: BoxFit.cover,
                  ),

                  // Top Row
                  Positioned(
                    top: 66.h,
                    left: 24.w,
                    right: 24.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () => context.go(Path.homepage),
                          child: const Icon(Icons.arrow_back_ios, size: 20),
                        ),
                        TextWidget(
                          text: 'Profile',
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
                  ),

                  // Profile image
                  Positioned(
                    bottom: -45.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        height: 120.w,
                        width: 120.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,

                          image: DecorationImage(
                            image: NetworkImage(photoUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 55.h),
          Text(
            userName,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: theme.textTheme.displaySmall!.color,
            ),
          ),
          Text(
            email,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: theme.textTheme.bodyLarge!.color,
            ),
          ),

          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              children: const [
                ProfileTile(
                  img: 'assets/images/diamond.svg',
                  label: 'Invite Friends',
                ),
                Divider(color: Colors.grey),
                ProfileTile(
                  img: 'assets/images/person.svg',
                  label: 'Account info',
                ),
                ProfileTile(
                  img: 'assets/images/pp.svg',
                  label: 'Personal profile',
                ),
                ProfileTile(
                  img: 'assets/images/msil.svg',
                  label: 'Message center',
                ),
                ProfileTile(
                  img: 'assets/images/shield.svg',
                  label: 'Login and security',
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CustomButtonWidget(
              buttonName: 'Log Out',
              textStyle: TextStyle(
                color: theme.textTheme.displayMedium!.color!,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                CustomSnackBar.show(context, 'Sign out Successfully');
                context.go(Path.onBoarding);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
