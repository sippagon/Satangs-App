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

class WealthCustomLineChart extends StatefulWidget {
  const WealthCustomLineChart({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<WealthLineChartDataStruct> chartData;

  @override
  State<WealthCustomLineChart> createState() => _WealthCustomLineChartState();
}

class _WealthCustomLineChartState extends State<WealthCustomLineChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            primaryYAxis: NumericAxis(
                rangePadding: ChartRangePadding.auto,
                numberFormat: NumberFormat.compact()),
            tooltipBehavior: TooltipBehavior(enable: true),
            legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                overflowMode: LegendItemOverflowMode.wrap),
            series: <CartesianSeries>[
          StackedLineSeries<WealthLineChartDataStruct, String>(
              name: 'ความมั่งคั่งที่ควรมี',
              groupName: 'Group A',
              markerSettings: MarkerSettings(isVisible: true),
              dataSource: widget.chartData,
              xValueMapper: (WealthLineChartDataStruct data, _) =>
                  data.ageDisplay,
              yValueMapper: (WealthLineChartDataStruct data, _) =>
                  data.wealthYouShouldHave),
          StackedLineSeries<WealthLineChartDataStruct, String>(
              name: 'ความมั่งคั่งสุทธิ',
              groupName: 'Group B',
              markerSettings: MarkerSettings(isVisible: true),
              dataSource: widget.chartData,
              xValueMapper: (WealthLineChartDataStruct data, _) =>
                  data.ageDisplay,
              yValueMapper: (WealthLineChartDataStruct data, _) =>
                  data.wealthYouHave),
        ]));
  }
}
