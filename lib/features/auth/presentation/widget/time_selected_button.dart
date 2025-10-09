import 'package:flutter/material.dart';

class TimeSelectorTextOnly extends StatefulWidget {
  const TimeSelectorTextOnly({super.key});

  @override
  _TimeSelectorTextOnlyState createState() => _TimeSelectorTextOnlyState();
}

class _TimeSelectorTextOnlyState extends State<TimeSelectorTextOnly> {
  String selectedOption = 'Day';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final options = ['Day', 'Week', 'Month', 'Year'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: options.map((option) {
        final isSelected = selectedOption == option;

        final textWidget = Text(
          option,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey[700],
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
            fontSize: 13,
          ),
        );

        final button = TextButton(
          onPressed: () {
            setState(() {
              selectedOption = option;
            });
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: isSelected
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 33,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: textWidget,
                )
              : textWidget,
        );

        return button;
      }).toList(),
    );
  }
}
