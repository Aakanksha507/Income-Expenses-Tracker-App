import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget? child;
  final void Function()? onPressed;
  const CustomElevatedButton({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ButtonStyle(
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        overlayColor: MaterialStateProperty.resolveWith<Color?>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.green.withOpacity(0.1);
          }
          return null;
        }),
        backgroundColor: theme.elevatedButtonTheme.style!.backgroundColor,
      ),
      onPressed:
          onPressed ??
          () {
            context.go(Path.connect);
          },
      child:
          child ??
          TextWidget(
            text: 'pay',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: theme.primaryColor,
            ),
          ),
    );
  }
}
