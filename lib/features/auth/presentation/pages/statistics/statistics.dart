import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/enum.dart';
import 'package:incomeexpensestracker/features/auth/presentation/data/model/expenses.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/hive_data_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_navigation_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/time_selected_button.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalesData {
  final String period;
  final double total;

  SalesData(this.period, this.total);
}

class Statistics extends ConsumerStatefulWidget {
  const Statistics({super.key});

  @override
  ConsumerState<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends ConsumerState<Statistics> {
  String selectedPeriod = 'Day';

  @override
  Widget build(BuildContext context) {
    final allExpenses = ref.watch(expensesBoxProvider).values.toList();

    final filteredData = getFilteredExpenseData(allExpenses, selectedPeriod);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 66),
        child: Column(
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => context.go(Path.homepage),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const TextWidget(
                  text: 'Statistics',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const Icon(
                  Icons.file_download_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Time Filter
            TimeSelectorTextOnly(
              onSelected: (value) {
                setState(() {
                  selectedPeriod = value;
                });
              },
            ),

            const SizedBox(height: 20),

            // Chart
            SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              title: ChartTitle(text: 'Expenses'),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  dataSource: filteredData,
                  xValueMapper: (SalesData data, _) => data.period,
                  yValueMapper: (SalesData data, _) => data.total,
                  color: Colors.red,
                  markerSettings: const MarkerSettings(isVisible: true),
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Top Spending
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: 'Top Spending',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SvgPicture.asset('assets/images/sync.svg'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }

  List<SalesData> getFilteredExpenseData(
    List<Expense> allExpenses,
    String filter,
  ) {
    Map<String, double> grouped = {};

    for (var expense in allExpenses) {
      final category = ExpensesCategory.values.firstWhere(
        (e) => e.name.toLowerCase() == expense.category.toLowerCase(),
        orElse: () => ExpensesCategory.youtube,
      );

      if (category.isIncome) continue;

      final date = DateTime.tryParse(expense.date);
      if (date == null) continue;

      final amount = double.tryParse(expense.amount) ?? 0;

      String key;
      switch (filter) {
        case 'Day':
          key = DateFormat('dd MMM').format(date);
          break;
        case 'Week':
          final weekStart = date.subtract(Duration(days: date.weekday - 1));
          key = 'Wk of ${DateFormat('dd MMM').format(weekStart)}';
          break;
        case 'Month':
          key = DateFormat('MMM').format(date);
          break;
        case 'Year':
          key = DateFormat('yyyy').format(date);
          break;
        default:
          key = DateFormat('dd MMM').format(date);
      }

      grouped[key] = (grouped[key] ?? 0) + amount;
    }

    final sortedKeys = grouped.keys.toList()
      ..sort(
        (a, b) =>
            _parseSortDate(a, filter).compareTo(_parseSortDate(b, filter)),
      );

    return sortedKeys.map((k) => SalesData(k, grouped[k]!)).toList();
  }

  DateTime _parseSortDate(String key, String filter) {
    try {
      switch (filter) {
        case 'Day':
          return DateFormat('dd MMM').parse(key);
        case 'Week':
          return DateFormat("'Wk of' dd MMM").parse(key);
        case 'Month':
          return DateFormat('MMM').parse(key);
        case 'Year':
          return DateFormat('yyyy').parse(key);
        default:
          return DateTime.now();
      }
    } catch (_) {
      return DateTime.now();
    }
  }
}
