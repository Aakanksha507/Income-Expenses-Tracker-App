import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class TextFormWidget extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autoFocus;

  const TextFormWidget({
    super.key,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.onChanged,
    this.onTap,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.autoFocus = false,
  });

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _hasText = _controller.text.isNotEmpty;

    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasText = _controller.text.isNotEmpty;
    });
    widget.onChanged?.call(_controller.text);
  }

  void _onFocusChanged() {
    setState(() {});
  }

  void _clearText() {
    _controller.clear();
    setState(() {
      _hasText = false;
    });
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _focusNode.dispose();
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null && widget.labelText!.isNotEmpty) ...[
          TextWidget(
            text: widget.labelText!,
            style: TextStyle(
              color: theme.textTheme.titleSmall?.color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8.h),
        ],

        TextFormField(
          controller: _controller,
          focusNode: _focusNode,
          autofocus: widget.autoFocus,
          keyboardType: widget.keyboardType ?? TextInputType.text,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          validator: widget.validator,
          style: TextStyle(
            color: theme.textTheme.titleSmall?.color,
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Color(0xFFCACACA)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: theme.primaryColor, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(color: Colors.red, width: 1.5),
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFFCACACA),
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: _hasText && _focusNode.hasFocus
                ? InkWell(
                    onTap: _clearText,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12.h),
                      child: TextWidget(
                        text: 'clear',

                        style: TextStyle(
                          color: theme.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal,
                        ),
                        //   icon: Icon(Icons.clear, size: 20),
                        //   onPressed: _clearText,
                        //   padding: EdgeInsets.zero,
                        //   constraints: BoxConstraints(),
                      ),
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
