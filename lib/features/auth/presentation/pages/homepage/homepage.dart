import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/creditcard_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

// class ChartData {
//   ChartData(this.x, this.y);
//   final String x;
//   final double y;
// }

// List<ChartData> _chartData = [
//   ChartData('Jan', 35),
//   ChartData('Feb', 28),
//   ChartData('Mar', 34),
//   ChartData('Apr', 32),
//   ChartData('May', 40),
// ];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                        text: 'Emile Morgeana',
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
            padding: EdgeInsetsGeometry.only(top: 105),
            child: CreditcardWidget(),
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
                SizedBox(height: 20),
                // SfCartesianChart(primaryXAxis: CategoryAxis()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'Send Again',
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
          context.go(Path.addexpense);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
