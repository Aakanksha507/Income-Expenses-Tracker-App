import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_form_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class CardWallet extends ConsumerStatefulWidget {
  const CardWallet({super.key});

  @override
  ConsumerState<CardWallet> createState() => _CardWalletState();
}

class _CardWalletState extends ConsumerState<CardWallet> {
  //controller
  final cardNameController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cvcController = TextEditingController();
  final dateController = TextEditingController();
  final zipController = TextEditingController();
  //focusNode
  final cardNameFocusNode = FocusNode();
  final cardNumberFocusNode = FocusNode();
  final cvcFocusNode = FocusNode();
  final zipNode = FocusNode();
  bool showClearButton = false;

  // Date
  String _formatDate(DateTime date) {
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    return '${days[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 65.w),
                child: Container(
                  height: 183.h,
                  width: 284.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff027F87), Color(0xff57E3B9)],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45, right: 45, top: 16),
                child: Container(
                  height: 211.h,
                  width: 324.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/card.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: 'Debit',
                                  style: TextStyle(
                                    color: theme.textTheme.displayMedium!.color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.1,
                                  ),
                                ),
                                TextWidget(
                                  text: 'Card',
                                  style: TextStyle(
                                    color: theme.textTheme.displayMedium!.color,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11.1,
                                  ),
                                ),
                              ],
                            ),
                            TextWidget(
                              text: 'Mono',
                              style: TextStyle(
                                color: theme.textTheme.displayMedium!.color,
                                fontWeight: FontWeight.w800,
                                fontSize: 13.1,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 75.h),
                        TextWidget(
                          text: '1322  222  2222  43343',
                          style: TextStyle(
                            letterSpacing: 5,
                            color: theme.textTheme.displayMedium!.color,
                            fontWeight: FontWeight.w800,
                            fontSize: 13.69,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: 'Invas Moses'.toUpperCase(),
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                color: theme.textTheme.displayMedium!.color,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.69,
                              ),
                            ),
                            TextWidget(
                              text: '22/01',
                              style: TextStyle(
                                color: theme.textTheme.displayMedium!.color,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.69,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 30, left: 25.w, right: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Add your debit Card',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8.h),
                TextWidget(
                  text:
                      'This card must be connected to a bank account under your name',
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.textTheme.titleMedium!.color,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 15.h),
                Column(
                  children: [
                    TextFormWidget(hintText: 'CARD NAME'),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextFormWidget(hintText: 'DEBIT CARD NUMBER'),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(child: TextFormWidget(hintText: 'CVC')),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                              );
                              if (picked != null) {
                                dateController.text = _formatDate(picked);
                              }
                            },
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFCACACA)),

                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        dateController.text.isEmpty
                                            ? 'EXPIRATION MM/YY'
                                            : dateController.text,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                          color: dateController.text.isEmpty
                                              ? const Color(0xFFCACACA)
                                              : theme
                                                    .textTheme
                                                    .titleSmall
                                                    ?.color,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.calendar_today,
                                      size: 20.w,
                                      color: const Color(0xFFCACACA),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // child: TextFormWidget(
                            //   hintText: 'EXPIRATION MM/YY',
                            //   suffixIcon: Icon(Icons.calendar_today, size: 20),
                            // ),
                          ),
                        ),

                        SizedBox(width: 10.w),
                        Expanded(child: TextFormWidget(hintText: 'ZIP')),
                      ],
                    ),
                  ],
                ),
                // CustomButtonWidget(buttonName: 'submit', textStyle: TextStyle(),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
