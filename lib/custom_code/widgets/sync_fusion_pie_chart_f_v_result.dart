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

class SyncFusionPieChartFVResult extends StatefulWidget {
  const SyncFusionPieChartFVResult({
    super.key,
    this.width,
    this.height,
    required this.fvOutput,
  });

  final double? width;
  final double? height;
  final FVOutputModelStruct fvOutput;

  @override
  State<SyncFusionPieChartFVResult> createState() =>
      _SyncFusionPieChartFVResultState();
}

class _SyncFusionPieChartFVResultState
    extends State<SyncFusionPieChartFVResult> {
  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.currency(
        locale: 'th_TH', symbol: '\THB', decimalDigits: 2);
    var pv = formatCurrency.format(widget.fvOutput.totalPresentValue);
    var interest = formatCurrency.format(widget.fvOutput.totalIntereset);
    var deposit = formatCurrency.format(widget.fvOutput.totalDeposit);

    final List<ChartData> chartData = [
      ChartData(
          'PV\n${pv}', widget.fvOutput.totalPresentValue, Color(0xFF003049)),
      ChartData('Interest\n${interest}', widget.fvOutput.totalIntereset,
          Color(0xFFD62828)),
      ChartData('Deposit\n${deposit}', widget.fvOutput.totalDeposit,
          Color(0xFFF77F00)),
    ];

    return Container(
        child: SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries<ChartData, String>>[
          PieSeries<ChartData, String>(
              dataSource: chartData,
              enableTooltip: false,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              dataLabelMapper: (ChartData data, _) => data.x,
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelIntersectAction: LabelIntersectAction.shift,
                  labelPosition: ChartDataLabelPosition.outside,
                  showCumulativeValues: false,
                  alignment: ChartAlignment.center,
                  textStyle: TextStyle(fontSize: 12, fontFamily: 'Readex Pro'),
                  connectorLineSettings: ConnectorLineSettings(
                      type: ConnectorType.curve, length: '25%')),
              radius: '60%')
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
