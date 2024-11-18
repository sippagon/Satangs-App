import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'edit_taxes_income_page_widget.dart' show EditTaxesIncomePageWidget;
import 'package:flutter/material.dart';

class EditTaxesIncomePageModel
    extends FlutterFlowModel<EditTaxesIncomePageWidget> {
  ///  Local state fields for this page.

  TaxesStruct? viewModel;
  void updateViewModelStruct(Function(TaxesStruct) updateFn) {
    updateFn(viewModel ??= TaxesStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getIndexFromGuid] action in EditTaxesIncomePage widget.
  int? updateIndex;
  // State field(s) for SalaryTextField widget.
  FocusNode? salaryTextFieldFocusNode;
  TextEditingController? salaryTextFieldTextController;
  String? Function(BuildContext, String?)?
      salaryTextFieldTextControllerValidator;
  String? _salaryTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุเงินเดือน';
    }

    return null;
  }

  // State field(s) for BonusTextField widget.
  FocusNode? bonusTextFieldFocusNode;
  TextEditingController? bonusTextFieldTextController;
  String? Function(BuildContext, String?)?
      bonusTextFieldTextControllerValidator;
  // State field(s) for OtherIncomeTextField widget.
  FocusNode? otherIncomeTextFieldFocusNode;
  TextEditingController? otherIncomeTextFieldTextController;
  String? Function(BuildContext, String?)?
      otherIncomeTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    salaryTextFieldTextControllerValidator =
        _salaryTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    salaryTextFieldFocusNode?.dispose();
    salaryTextFieldTextController?.dispose();

    bonusTextFieldFocusNode?.dispose();
    bonusTextFieldTextController?.dispose();

    otherIncomeTextFieldFocusNode?.dispose();
    otherIncomeTextFieldTextController?.dispose();
  }
}
