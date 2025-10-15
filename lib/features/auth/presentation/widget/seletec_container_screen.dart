import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';

class SelectableContainersScreen extends StatefulWidget {
  //   final String cardName;
  // final String cardNumber;
  // final String cvc;
  // final String expiry;
  // final String zip;

  const SelectableContainersScreen({
    super.key,
    // required this.cardName,
    // required this.cardNumber,
    // required this.cvc,
    // required this.expiry,
    // required this.zip,
  });

  @override
  State<SelectableContainersScreen> createState() =>
      _SelectableContainersScreenState();
}

class _SelectableContainersScreenState
    extends State<SelectableContainersScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 35.w, right: 35.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildSelectableContainer(
              0,
              'Bank Link',
              'Connect your bank account to deposit & fund',
              Icons.account_balance,
            ),
            SizedBox(height: 15.h),
            _buildSelectableContainer(
              1,
              'Microdeposits',
              'Connect bank in 5-7 days',
              Icons.paid_sharp,
            ),
            SizedBox(height: 15.h),
            _buildSelectableContainer(
              2,
              'Paypal',
              'Connect your PayPal account',
              Icons.account_balance_wallet_outlined,
            ),
            SizedBox(height: 100.h),

            CustomButtonWidget(
              buttonName: 'Next',
              textStyle: TextStyle(
                fontSize: 18.sp,
                color: theme.textTheme.bodyLarge!.color,
                fontWeight: FontWeight.w700,
              ),
              buttonColor: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(
                color: theme.primaryColor,
                style: BorderStyle.solid,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableContainer(
    int index,
    String text,
    String subtitle,
    IconData icon,
  ) {
    final theme = Theme.of(context);
    bool isSelected = _selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(20.0.r),
      splashColor: Colors.grey[300],
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        width: 344.w,
        height: 90.h,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1A438883) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
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
          subtitle: Text(
            subtitle,
            style: TextStyle(
              color: isSelected
                  ? theme.primaryColor
                  : theme.textTheme.titleSmall?.color,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: isSelected
              ? Icon(Icons.check_circle, color: theme.primaryColor)
              : null,
        ),
      ),
    );
  }
}
