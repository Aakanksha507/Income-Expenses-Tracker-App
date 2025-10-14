import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/seletec_container_screen.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
   
        children: [const SelectableContainersScreen()],
      ),
    );
  }
}
