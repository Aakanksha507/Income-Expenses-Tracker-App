import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_form_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          AppBarHeader(
            dynamicWidget: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 66),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      print('Tapped');
                      context.go(Path.homepage);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 20),
                  ),

                  TextWidget(
                    text: 'Add Expense',
                    style: TextStyle(
                      color: theme.textTheme.displayMedium!.color,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: theme.iconTheme.color,
                    size: 35,
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('assets/images/top_bg.svg'),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 155.h, left: 28.w),
              child: Container(
                height: 500.h,
                width: 358.w,
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormWidget(labelText: 'NAME'),
                      SizedBox(height: 25),
                      TextFormWidget(
                        labelText: 'AMOUNT',
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 25),
                      TextFormWidget(
                        labelText: 'DATE',
                        onChanged: (val) {},
                        keyboardType: TextInputType.none,
                        onTap: () async {
                          FocusScope.of(context).requestFocus(FocusNode());

                          final DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );

                          // if (picked != null) {
                          //   dateController.text = picked
                          //       .toIso8601String()
                          //       .split('T')
                          //       .first;
                          // }
                        },
                      ),

                      SizedBox(height: 25),
                      TextFormWidget(labelText: 'INVOICE'),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
