import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'budget_allocate_form_input_widget.dart'
    show BudgetAllocateFormInputWidget;
import 'package:flutter/material.dart';

class BudgetAllocateFormInputModel
    extends FlutterFlowModel<BudgetAllocateFormInputWidget> {
  ///  Local state fields for this component.

  BudgetTrasactionCategoriesStruct? budgetCategoryData;
  void updateBudgetCategoryDataStruct(
      Function(BudgetTrasactionCategoriesStruct) updateFn) {
    updateFn(budgetCategoryData ??= BudgetTrasactionCategoriesStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
