import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarHeader extends StatelessWidget {
  final Widget? dynamicWidget;
  const AppBarHeader({super.key, this.dynamicWidget});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 257.h,
      width: 414.w,
      decoration: BoxDecoration(
        // image: DecorationImage(image: SvgAssetLoader('assets/images/top_bg.svg')),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff429690), Color(0xff2A7C76)],
        ),
        // color: theme.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.elliptical(270, 47),
          bottomLeft: Radius.elliptical(270, 47),
        ),
      ),
      child: dynamicWidget,
    );
  }
}
