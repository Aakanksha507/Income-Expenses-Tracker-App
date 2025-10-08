import 'package:flutter/material.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/appbarheader.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/creditcard_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

List<ChartData> _chartData = [
  ChartData('Jan', 35),
  ChartData('Feb', 28),
  ChartData('Mar', 34),
  ChartData('Apr', 32),
  ChartData('May', 40),
];

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          AppBarHeader(),
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
                SfCartesianChart(primaryXAxis: CategoryAxis()),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
