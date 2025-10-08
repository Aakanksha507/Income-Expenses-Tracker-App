import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x555E5817),
            offset: const Offset(0, 5),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        // borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
        child: NavigationBar(
          backgroundColor: Colors.white,
          height: 92.h,
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            return const TextStyle(fontSize: 0);
          }),
          destinations: [
            NavigationDestination(
              icon: SvgPicture.asset('assets/images/home.svg'),
              selectedIcon: SvgPicture.asset('assets/images/home_fill.svg'),
              label: '',
            ),

            NavigationDestination(
              icon: SvgPicture.asset('assets/images/barchart.svg'),
              selectedIcon: SvgPicture.asset('assets/images/barchart_fill.svg'),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/images/wallet.svg'),
              selectedIcon: SvgPicture.asset('assets/images/wallet_fill.svg'),
              label: '',
            ),
            NavigationDestination(
              icon: SvgPicture.asset('assets/images/user.svg'),
              selectedIcon: SvgPicture.asset('assets/images/user_fill.svg'),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
