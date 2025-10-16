import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_snack_bar.dart';

class ProfileTile extends StatelessWidget {
  final String img;
  final String? label;

  const ProfileTile({required this.img, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(img),
      title: Text(
        label ?? '',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        CustomSnackBar.show(context, 'Coming Soon');
      },
    );
  }
}
