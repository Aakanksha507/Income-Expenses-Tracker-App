import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/expenses.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/expenses_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/dropdown_field_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class AddExpense extends ConsumerStatefulWidget {
  const AddExpense({super.key});

  @override
  ConsumerState<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends ConsumerState<AddExpense> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController invoiceController = TextEditingController();
  final FocusNode amountFocusNode = FocusNode();
  bool showClearButton = false;

  @override
  void initState() {
    super.initState();
    amountController.addListener(_onAmountChanged);
    amountFocusNode.addListener(_onAmountFocusChanged);
  }

  void _onAmountChanged() {
    setState(() {
      showClearButton =
          amountController.text.isNotEmpty && amountFocusNode.hasFocus;
    });
  }

  void _onAmountFocusChanged() {
    setState(() {
      showClearButton =
          amountController.text.isNotEmpty && amountFocusNode.hasFocus;
    });
  }

  void _clearAmount() {
    amountController.clear();
    setState(() {
      showClearButton = false;
    });
  }

  @override
  void dispose() {
    amountController.removeListener(_onAmountChanged);
    amountFocusNode.removeListener(_onAmountFocusChanged);
    amountFocusNode.dispose();
    amountController.dispose();
    dateController.dispose();
    invoiceController.dispose();
    super.dispose();
  }

  void _submitExpense() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('User not logged in')));
      return;
    }

    final selectedCategory = ref.read(selectedCategoryProvider);
    final amount = amountController.text;
    final date = dateController.text;

    if (selectedCategory == null || amount.isEmpty || date.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    final newExpense = Expense(
      userId: currentUser.uid,
      category: selectedCategory.label(context),
      amount: amount,
      date: date,
      categoryImage: selectedCategory.getAssets(context),
      invoicePath: selectedInvoiceImage?.path,
    );

    final box = Hive.box<Expense>('expensesBox');
    box.add(newExpense);

    // Clear form
    ref.read(selectedCategoryProvider.notifier).state = null;
    amountController.clear();
    dateController.clear();
    setState(() {
      selectedInvoiceImage = null;
    });

    context.go(Path.homepage);
  }

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

  File? selectedInvoiceImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/top_bg.svg'),
          AppBarHeader(
            dynamicWidget: Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 66),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.go(Path.homepage),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                      color: theme.iconTheme.color,
                    ),
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
              padding: EdgeInsets.only(top: 155.h, left: 28.w, right: 28.w),
              child: Container(
                height: 600.h,
                width: 358.w,
                decoration: BoxDecoration(
                  color: theme.cardTheme.color,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      DropdownFieldWidget(
                        labelText: 'CATEGORY',
                        hintText: 'Select a category',
                      ),

                      SizedBox(height: 25.h),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'AMOUNT',
                            style: TextStyle(
                              color: theme.textTheme.titleSmall?.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFCACACA),
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    right: 5,
                                    top: 15.h,
                                    bottom: 15.h,
                                  ),
                                  child: Text(
                                    '\$',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: theme.textTheme.titleSmall?.color,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: amountController,
                                    focusNode: amountFocusNode,
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: theme.textTheme.titleSmall?.color,
                                    ),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '0.00',
                                      hintStyle: TextStyle(
                                        color: Color(0xFFCACACA),
                                      ),
                                    ),
                                  ),
                                ),
                                if (showClearButton)
                                  Padding(
                                    padding: EdgeInsets.only(right: 16.w),
                                    child: GestureDetector(
                                      onTap: _clearAmount,
                                      child: Text(
                                        'Clear',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: theme.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 25.h),

                      // DATE Field
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'DATE',
                            style: TextStyle(
                              color: theme.textTheme.titleSmall?.color,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          GestureDetector(
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
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xFFCACACA),
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      dateController.text.isEmpty
                                          ? 'Select date'
                                          : dateController.text,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: dateController.text.isEmpty
                                            ? const Color(0xFFCACACA)
                                            : theme.textTheme.titleSmall?.color,
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
                        ],
                      ),

                      SizedBox(height: 25.h),

                      // INVOICE Field
                      TextWidget(
                        text: 'INVOICE',
                        style: TextStyle(
                          color: theme.textTheme.titleSmall?.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? image = await picker.pickImage(
                            source: ImageSource.gallery,
                          );

                          if (image != null) {
                            setState(() {
                              selectedInvoiceImage = File(image.path);
                            });
                          }
                        },
                        child: Container(
                          height: 50.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFCACACA)),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Add Invoice',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFFCACACA),
                                ),
                              ),

                              Icon(
                                Icons.add,
                                size: 20.w,
                                color: const Color(0xFFCACACA),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (selectedInvoiceImage != null)
                        Padding(
                          padding: EdgeInsets.only(top: 12.h, left: 100),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.file(
                                  selectedInvoiceImage!,
                                  width: 70.w,
                                  height: 70.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 24.w,
                                ),
                                onPressed: () {
                                  setState(() {
                                    selectedInvoiceImage = null;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),

                      SizedBox(height: 30.h),

                      // Submit Button
                      CustomButtonWidget(
                        buttonName: 'Submit',
                        height: 55.h,
                        textStyle: TextStyle(
                          color: theme.textTheme.displayMedium!.color!,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        onPressed: _submitExpense,
                      ),
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
