import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenLayout extends StatelessWidget {
  final Widget? dynamicWidget;
  final Widget? dynamicWidget2;
  const ScreenLayout({super.key, this.dynamicWidget, this.dynamicWidget2});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          height: 257.h,
          width: 414.w,
          decoration: BoxDecoration(color: theme.primaryColor),
          child: dynamicWidget,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 165.0),
          child: Container(
            width: 414.w,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: dynamicWidget2,
          ),
        ),
      ],
    );
  }
}
