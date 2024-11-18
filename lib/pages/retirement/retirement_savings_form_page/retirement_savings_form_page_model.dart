import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'retirement_savings_form_page_widget.dart'
    show RetirementSavingsFormPageWidget;
import 'package:flutter/material.dart';

class RetirementSavingsFormPageModel
    extends FlutterFlowModel<RetirementSavingsFormPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for SavingsAmountField widget.
  FocusNode? savingsAmountFieldFocusNode;
  TextEditingController? savingsAmountFieldTextController;
  String? Function(BuildContext, String?)?
      savingsAmountFieldTextControllerValidator;
  // State field(s) for MonthlySavingsField widget.
  FocusNode? monthlySavingsFieldFocusNode;
  TextEditingController? monthlySavingsFieldTextController;
  String? Function(BuildContext, String?)?
      monthlySavingsFieldTextControllerValidator;
  // State field(s) for SavingsInterestField widget.
  FocusNode? savingsInterestFieldFocusNode;
  TextEditingController? savingsInterestFieldTextController;
  String? Function(BuildContext, String?)?
      savingsInterestFieldTextControllerValidator;
  // Stores action output result for [Custom Action - calculateRetirementResults] action in Button widget.
  RetirementCalculationResultModelStruct? calculateResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    savingsAmountFieldFocusNode?.dispose();
    savingsAmountFieldTextController?.dispose();

    monthlySavingsFieldFocusNode?.dispose();
    monthlySavingsFieldTextController?.dispose();

    savingsInterestFieldFocusNode?.dispose();
    savingsInterestFieldTextController?.dispose();
  }
}
