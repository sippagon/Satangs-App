import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'taxes_plan_details_page_widget.dart' show TaxesPlanDetailsPageWidget;
import 'package:flutter/material.dart';

class TaxesPlanDetailsPageModel
    extends FlutterFlowModel<TaxesPlanDetailsPageWidget> {
  ///  Local state fields for this page.

  TaxesStruct? taxData;
  void updateTaxDataStruct(Function(TaxesStruct) updateFn) {
    updateFn(taxData ??= TaxesStruct());
  }

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? taxDetailPageController;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in TaxesPlanDetailsPage widget.
  int? dataIndex;
  // Stores action output result for [Bottom Sheet - DeleteConfirmation] action in IconButton widget.
  bool? confirmResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taxDetailPageController?.finish();
  }
}
