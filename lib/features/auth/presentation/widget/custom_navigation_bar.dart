import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/navigation_provider.dart';

class CustomNavigationBar extends ConsumerStatefulWidget {
  const CustomNavigationBar({super.key});

  @override
  ConsumerState<CustomNavigationBar> createState() =>
      _CustomNavigationBarState();
}

class _CustomNavigationBarState extends ConsumerState<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    final selectedIndex = ref.read(navigationIndexProvider);
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
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            ref.read(navigationIndexProvider.notifier).state = index;
            switch (index) {
              case 0:
                context.go(Path.homepage);
              case 1:
                context.go(Path.statistics);
              case 2:
                context.go(Path.homepage);
              case 3:
                context.go(Path.profile);
            }
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
