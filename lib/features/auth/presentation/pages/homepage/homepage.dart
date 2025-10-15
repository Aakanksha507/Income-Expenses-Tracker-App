import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
import 'package:incomeexpensestracker/features/auth/presentation/pages/alert_dialogue/alert_dialogue.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/hive_data_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/creditcard_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/total_balance.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  String userName = '';
  String category = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final userBox = ref.watch(userBoxProvider);

    final userName = userBox.get('name', defaultValue: 'User');
    final expensesBox = ref.watch(expensesBoxProvider);
    final allExpenses = expensesBox.values.toList();
    final totals = calculateTotals(allExpenses);
    final income = totals['income']!;
    final expenses = totals['expenses']!;
    final balance = totals['balance']!;

    //to fo show dialogue state

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          AppBarHeader(
            dynamicWidget: Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20, top: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Good Afternoon,',
                    style: TextStyle(
                      color: theme.textTheme.displayMedium!.color,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: userName,
                        style: TextStyle(
                          color: theme.textTheme.displayMedium!.color,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Icon(Icons.notifications_none_outlined),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('assets/images/top_bg.svg'),
          Padding(
            padding: const EdgeInsets.only(top: 105),
            child: CreditcardWidget(
              income: income,
              expenses: expenses,
              balance: balance,
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20, top: 340),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Transaction History',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextWidget(
                      text: 'See all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                SizedBox(
                  height: 380,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: allExpenses.length,
                    itemBuilder: (context, index) {
                      final expense = allExpenses[index];
                      final category = ExpensesCategory.values.firstWhere(
                        (e) =>
                            e.name.toLowerCase() ==
                            expense.category.toLowerCase(),
                        orElse: () => ExpensesCategory.youtube,
                      );

                      final color = category.amountColor;
                      return Dismissible(
                        key: Key(expense.key.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          expense.delete();
                          setState(() {});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Expense deleted')),
                          );
                        },
                        child: ListTile(
                          leading: expense.categoryImage != null
                              ? Image.asset(
                                  expense.categoryImage!,
                                  width: 24,
                                  height: 24,
                                )
                              : Icon(Icons.image_not_supported),
                          title: TextWidget(
                            text: expense.category,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: TextWidget(
                            text: expense.date,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          trailing: Text(
                            '\$${expense.amount}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: color,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     TextWidget(
                //       text: 'Send Again',
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //     TextWidget(
                //       text: 'See all',
                //       style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.w100,
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        splashColor: theme.floatingActionButtonTheme.splashColor,
        backgroundColor: theme.floatingActionButtonTheme.backgroundColor,

        onPressed: () {
          // context.go(Path.addexpense);

          showDialog(
            context: context,
            builder: (context) => AlertDialogueWidget(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
