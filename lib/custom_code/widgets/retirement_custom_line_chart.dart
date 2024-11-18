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

class RetirementCustomLineChart extends StatefulWidget {
  const RetirementCustomLineChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<RetirementCalculationLineChartStruct> chartData;

  @override
  State<RetirementCustomLineChart> createState() =>
      _RetirementCustomLineChartState();
}

class _RetirementCustomLineChartState extends State<RetirementCustomLineChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(interval: 5),
            primaryYAxis: NumericAxis(
                // Applies currency format for y axis labels and also for data labels
                numberFormat: NumberFormat.decimalPattern(),
                rangePadding: ChartRangePadding.auto),
            tooltipBehavior: TooltipBehavior(enable: true),
            legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap),
            series: <CartesianSeries>[
          StackedLineSeries<RetirementCalculationLineChartStruct, int>(
              name: 'รายรับ',
              groupName: 'Income',
              markerSettings: MarkerSettings(isVisible: false),
              dataSource: widget.chartData,
              xValueMapper: (RetirementCalculationLineChartStruct data, _) =>
                  data.age,
              yValueMapper: (RetirementCalculationLineChartStruct data, _) =>
                  data.income),
          StackedLineSeries<RetirementCalculationLineChartStruct, int>(
              name: 'รายจ่าย',
              groupName: 'Expense',
              markerSettings: MarkerSettings(isVisible: false),
              dataSource: widget.chartData,
              xValueMapper: (RetirementCalculationLineChartStruct data, _) =>
                  data.age,
              yValueMapper: (RetirementCalculationLineChartStruct data, _) =>
                  data.expense),
          StackedLineSeries<RetirementCalculationLineChartStruct, int>(
              name: 'เงินออม',
              groupName: 'Savings',
              markerSettings: MarkerSettings(isVisible: false),
              dataSource: widget.chartData,
              xValueMapper: (RetirementCalculationLineChartStruct data, _) =>
                  data.age,
              yValueMapper: (RetirementCalculationLineChartStruct data, _) =>
                  data.savings),
        ]));
  }
}
