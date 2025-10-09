import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/time_selected_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  final String month;
  final double sales;

  SalesData(this.month, [this.sales = 0]);
}

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 66),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    context.go(Path.homepage);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                TextWidget(
                  text: 'Statistics',
                  style: TextStyle(
                    // color: theme.textTheme.displayMedium!.color,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.file_download_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 8, right: 8),
              child: TimeSelectorTextOnly(),
            ),
            SizedBox(height: 20),
            SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),

              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                  dataSource: <SalesData>[
                    SalesData('Jan'),
                    SalesData('Feb'),
                    SalesData('Mar'),
                    SalesData('Apr'),
                    SalesData('May'),
                  ],
                  xValueMapper: (SalesData sales, _) => sales.month,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: 'Top Spending',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/images/sync.svg'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
