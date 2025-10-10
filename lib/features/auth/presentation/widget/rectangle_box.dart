import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableContainersScreen extends StatefulWidget {
  const SelectableContainersScreen({super.key});

  @override
  State<SelectableContainersScreen> createState() =>
      _SelectableContainersScreenState();
}

class _SelectableContainersScreenState
    extends State<SelectableContainersScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildSelectableContainer(
              0,
              'Bank Link',
              'Connect your bank account to deposit & fund',
              Icons.account_balance,
            ),
            const SizedBox(height: 15),
            _buildSelectableContainer(
              1,
              'Microdeposits',
              'Connect bank in 5-7 days',
              Icons.paid_sharp,
            ),
            const SizedBox(height: 15),
            _buildSelectableContainer(
              2,
              'Paypal',
              'Connect you paypal account',
              Icons.paypal,
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
          color: isSelected ? Color(0x1A438883) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20.0.r),
        ),
        child: Center(
          child: ListTile(
            leading: isSelected
                ? Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Icon(icon, color: theme.primaryColor, size: 34),
                  )
                : Icon(icon, color: Colors.grey[600], size: 34),
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
                    : theme.textTheme.titleSmall!.color,
                fontSize: 12.sp,
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
