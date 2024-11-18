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

class SyncFusionDonutChartTrans extends StatefulWidget {
  const SyncFusionDonutChartTrans({
    super.key,
    this.width,
    this.height,
    required this.chartData,
  });

  final double? width;
  final double? height;
  final List<DonutChartDataStruct> chartData;

  @override
  State<SyncFusionDonutChartTrans> createState() =>
      _SyncFusionDonutChartTransState();
}

class _SyncFusionDonutChartTransState extends State<SyncFusionDonutChartTrans> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries<DonutChartDataStruct, String>>[
          PieSeries<DonutChartDataStruct, String>(
              dataSource: widget.chartData,
              enableTooltip: true,
              //pointColorMapper: (DonutChartDataStruct data, _) => data.color,
              xValueMapper: (DonutChartDataStruct data, _) => data.label,
              yValueMapper: (DonutChartDataStruct data, _) => data.value,
              dataLabelMapper: (DonutChartDataStruct data, _) => data.label,
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelIntersectAction: LabelIntersectAction.shift,
                  labelPosition: ChartDataLabelPosition.outside,
                  showCumulativeValues: true,
                  alignment: ChartAlignment.center,
                  textStyle: TextStyle(fontSize: 12, fontFamily: 'Readex Pro'),
                  connectorLineSettings: ConnectorLineSettings(
                      type: ConnectorType.curve, length: '25%')),
              radius: '60%')
        ]));
  }
}
