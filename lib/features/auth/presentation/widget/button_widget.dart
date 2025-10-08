import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  final String buttonName;
  final Color? buttonColor;
  final Color? splashColor;
  final String? buttonIcon;
  final Widget? child;
  final TextStyle? textStyle;

  const CustomButtonWidget({
    super.key,
    this.onPressed,
    required this.buttonName,
    this.buttonColor,
    this.splashColor,
    this.buttonIcon,
    this.child,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: buttonColor ?? theme.primaryColor,
      borderRadius: BorderRadius.circular(40.r),
      child: InkWell(
        onTap: onPressed,

        borderRadius: BorderRadius.circular(40.r),
        child: Container(
          height: 67.h,
          width: 353.w,
          alignment: Alignment.center,
          child: child != null
              ? child!
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (buttonIcon != null)
                      Padding(
                        padding: EdgeInsets.only(right: 42.63.w),
                        child: SvgPicture.asset(buttonIcon!),
                      ),
                    TextWidget(text: buttonName, style: textStyle),
                  ],
                ),
        ),
      ),
    );
  }
}
