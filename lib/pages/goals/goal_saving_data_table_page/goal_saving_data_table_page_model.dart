import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_saving_data_table_page_widget.dart'
    show GoalSavingDataTablePageWidget;
import 'package:flutter/material.dart';

class GoalSavingDataTablePageModel
    extends FlutterFlowModel<GoalSavingDataTablePageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<GoalMonthSavingDataTableStruct>();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    paginatedDataTableController.dispose();
  }
}
