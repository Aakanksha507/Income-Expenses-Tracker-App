import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

int _selectedIndex = -1;

class SelectedContainer extends StatelessWidget {
  final int index;
  final String text;
  final String? subtitle;
  final IconData icon;
  const SelectedContainer({
    super.key,
    required this.index,
    required this.text,
    this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isSelected = _selectedIndex == index;
    return InkWell(
      borderRadius: BorderRadius.circular(20.0.r),
      splashColor: Colors.grey[300],
      // onTap: () {
      //   setState(() {
      //     _selectedIndex = index;
      //   });
      // },
      child: Container(
        width: 344.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: isSelected ? Color(0x1A438883) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Center(
          child: ListTile(
            leading: isSelected
                ? Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Icon(icon, color: theme.primaryColor, size: 34.sp),
                  )
                : Icon(icon, color: Colors.grey[600], size: 34.sp),
            title: Text(
              text,
              style: TextStyle(
                color: isSelected ? theme.primaryColor : Colors.grey[600],
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),

            trailing: isSelected
                ? Icon(Icons.check_circle, color: theme.primaryColor)
                : null,
          ),
        ),
      ),
    );
  }
}
