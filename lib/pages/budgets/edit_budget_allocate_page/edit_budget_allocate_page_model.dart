import '/componants/budget_allocate_form_input/budget_allocate_form_input_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_budget_allocate_page_widget.dart'
    show EditBudgetAllocatePageWidget;
import 'package:flutter/material.dart';

class EditBudgetAllocatePageModel
    extends FlutterFlowModel<EditBudgetAllocatePageWidget> {
  ///  Local state fields for this page.

  bool formValid = false;

  ///  State fields for stateful widgets in this page.

  // Models for BudgetAllocateFormInput dynamic component.
  late FlutterFlowDynamicModels<BudgetAllocateFormInputModel>
      budgetAllocateFormInputModels;
  // Stores action output result for [Custom Action - sumBudgetCategoriesAmount] action in Button widget.
  double? sumValue;

  @override
  void initState(BuildContext context) {
    budgetAllocateFormInputModels =
        FlutterFlowDynamicModels(() => BudgetAllocateFormInputModel());
  }

  @override
  void dispose() {
    budgetAllocateFormInputModels.dispose();
  }
}
