import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'budget_details_page_widget.dart' show BudgetDetailsPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class BudgetDetailsPageModel extends FlutterFlowModel<BudgetDetailsPageWidget> {
  ///  Local state fields for this page.

  BudgetDetailsViewModelStruct? budgetDetailsViewModel;
  void updateBudgetDetailsViewModelStruct(
      Function(BudgetDetailsViewModelStruct) updateFn) {
    updateFn(budgetDetailsViewModel ??= BudgetDetailsViewModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? budgetDetailPageController;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in BudgetDetailsPage widget.
  List<DateTime>? oneMonthDateRange;
  // Stores action output result for [Custom Action - mapBudgetDetailsViewModel] action in BudgetDetailsPage widget.
  BudgetDetailsViewModelStruct? viewModel;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in IconButton widget.
  int? updateIndex;
  // Stores action output result for [Bottom Sheet - DeleteConfirmation] action in IconButton widget.
  bool? confirmResult;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in IconButton widget.
  int? deleteIndex;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    budgetDetailPageController?.finish();
  }
}
