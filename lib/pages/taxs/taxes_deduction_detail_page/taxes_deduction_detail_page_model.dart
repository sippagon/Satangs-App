import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'taxes_deduction_detail_page_widget.dart'
    show TaxesDeductionDetailPageWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class TaxesDeductionDetailPageModel
    extends FlutterFlowModel<TaxesDeductionDetailPageWidget> {
  ///  Local state fields for this page.

  TaxesStruct? viewModel;
  void updateViewModelStruct(Function(TaxesStruct) updateFn) {
    updateFn(viewModel ??= TaxesStruct());
  }

  double totalPersonal = 0.0;

  double totalInsurance = 0.0;

  double totalDonate = 0.0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getIndexFromGuid] action in TaxesDeductionDetailPage widget.
  int? dateIndex;
  // Stores action output result for [Custom Action - sumDeductionGroupResult] action in TaxesDeductionDetailPage widget.
  List<double>? sumDeductionResult;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }
}
