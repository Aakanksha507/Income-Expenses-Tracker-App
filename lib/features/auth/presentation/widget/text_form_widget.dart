import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class TextFormWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  // final bool? obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  const TextFormWidget({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    // this.obscureText,
    this.keyboardType,
    this.validator,
    this.suffixIcon,
    this.inputFormatters,
    this.onChanged, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null && labelText!.isNotEmpty) ...[
          TextWidget(
            text: labelText!,
            style: TextStyle(
              color: theme.textTheme.titleSmall!.color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8.h),
        ] else ...[
          SizedBox(height: 2.h),
        ],

        TextFormField(
          inputFormatters: inputFormatters,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
  onTap: onTap, 
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
