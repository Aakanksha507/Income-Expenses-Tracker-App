import 'package:flutter/material.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

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
      onPressed: () {},
      child: TextWidget(
        text: 'pay',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: theme.primaryColor,
        ),
      ),
    );
  }
}
