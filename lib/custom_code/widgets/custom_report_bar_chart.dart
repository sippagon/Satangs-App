// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class CustomReportBarChart extends StatefulWidget {
  const CustomReportBarChart({
    super.key,
    this.width,
    this.height,
    required this.datas,
  });

  final double? width;
  final double? height;
  final List<BarChartMonthlyTransactionsStruct> datas;

  @override
  State<CustomReportBarChart> createState() => _CustomReportBarChartState();
}

class _CustomReportBarChartState extends State<CustomReportBarChart> {
  var _tooltip = TooltipBehavior(enable: true);
  DateFormat formatter = DateFormat('MMM');

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(minimum: 0),
            tooltipBehavior: _tooltip,
            series: <CartesianSeries<BarChartMonthlyTransactionsStruct,
                String>>[
          ColumnSeries<BarChartMonthlyTransactionsStruct, String>(
              dataSource: widget.datas,
              xValueMapper: (BarChartMonthlyTransactionsStruct data, _) =>
                  formatter.format(data.month!),
              yValueMapper: (BarChartMonthlyTransactionsStruct data, _) =>
                  data.totalIncome,
              name: 'Income',
              color: Color.fromARGB(255, 0, 210, 7),
              width: 0.8,
              spacing: 0.2,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          ColumnSeries<BarChartMonthlyTransactionsStruct, String>(
              dataSource: widget.datas,
              xValueMapper: (BarChartMonthlyTransactionsStruct data, _) =>
                  formatter.format(data.month!),
              yValueMapper: (BarChartMonthlyTransactionsStruct data, _) =>
                  data.totalExpense,
              name: 'Expense',
              color: Color.fromARGB(255, 255, 0, 0),
              width: 0.8,
              spacing: 0.2,
              borderRadius: BorderRadius.all(Radius.circular(5)))
        ]));
  }
}
