import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/debitcard.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/card_form_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';

class SelectableContainersScreen extends ConsumerStatefulWidget {
  const SelectableContainersScreen({super.key});

  @override
  ConsumerState<SelectableContainersScreen> createState() =>
      _SelectableContainersScreenState();
}

class _SelectableContainersScreenState
    extends ConsumerState<SelectableContainersScreen> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 35.w, right: 35.w),
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
            SizedBox(height: 70.h),

            /// Submit button
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
              onPressed: () async {
                final form = ref.read(cardFormProvider);

                if (form.cardName.isEmpty ||
                    form.cardNumber.isEmpty ||
                    form.date.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please complete all card fields."),
                    ),
                  );
                  return;
                }

                final box = await Hive.openBox<DebitCard>('debitCardBox');

                final newCard = DebitCard(
                  userId: form.userId.isNotEmpty ? form.userId : 'defaultUser',
                  cardName: form.cardName,
                  cardNumber: form.cardNumber,
                  cvc: form.cvc,
                  date: form.date,
                  zip: form.zip,
                );

                await box.add(newCard);
                context.go(Path.billdetails);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Card saved successfully")),
                );

                ref.read(cardFormProvider.notifier).clear();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Widget to build each selectable container (Bank Link, Microdeposits, etc.)
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
