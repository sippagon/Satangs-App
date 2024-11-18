import '/flutter_flow/flutter_flow_util.dart';
import 'debug_action_page_widget.dart' show DebugActionPageWidget;
import 'package:flutter/material.dart';

class DebugActionPageModel extends FlutterFlowModel<DebugActionPageWidget> {
  ///  Local state fields for this page.

  List<DateTime> dateRangeResult = [];
  void addToDateRangeResult(DateTime item) => dateRangeResult.add(item);
  void removeFromDateRangeResult(DateTime item) => dateRangeResult.remove(item);
  void removeAtIndexFromDateRangeResult(int index) =>
      dateRangeResult.removeAt(index);
  void insertAtIndexInDateRangeResult(int index, DateTime item) =>
      dateRangeResult.insert(index, item);
  void updateDateRangeResultAtIndex(int index, Function(DateTime) updateFn) =>
      dateRangeResult[index] = updateFn(dateRangeResult[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - showCustomDateRange] action in Button widget.
  List<DateTime>? outputTest;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
