import '/flutter_flow/flutter_flow_util.dart';
import 'add_taxes_page_widget.dart' show AddTaxesPageWidget;
import 'package:flutter/material.dart';

class AddTaxesPageModel extends FlutterFlowModel<AddTaxesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getLatestSalary] action in AddTaxesPage widget.
  double? latestSalary;
  // Stores action output result for [Custom Action - getTaxBonus] action in AddTaxesPage widget.
  double? bonusIncome;
  // Stores action output result for [Custom Action - getTaxOtherIncome] action in AddTaxesPage widget.
  double? otherIncome;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  String? _nameTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุชื่อแผน';
    }

    return null;
  }

  // State field(s) for TaxYearTextField widget.
  FocusNode? taxYearTextFieldFocusNode;
  TextEditingController? taxYearTextFieldTextController;
  String? Function(BuildContext, String?)?
      taxYearTextFieldTextControllerValidator;
  String? _taxYearTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุปีภาษี';
    }

    return null;
  }

  // Stores action output result for [Custom Action - showCustomYearPicker] action in Container widget.
  String? yearSelected;
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
  // Stores action output result for [Custom Action - validateDuplicateName] action in Button widget.
  bool? validName;
  // Stores action output result for [Custom Action - createRandomUuid] action in Button widget.
  String? generatedGuid;
  // Stores action output result for [Custom Action - createRandomUuid] action in Button widget.
  String? guidForPersonal;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    taxYearTextFieldTextControllerValidator =
        _taxYearTextFieldTextControllerValidator;
    salaryTextFieldTextControllerValidator =
        _salaryTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    taxYearTextFieldFocusNode?.dispose();
    taxYearTextFieldTextController?.dispose();

    salaryTextFieldFocusNode?.dispose();
    salaryTextFieldTextController?.dispose();

    bonusTextFieldFocusNode?.dispose();
    bonusTextFieldTextController?.dispose();

    otherIncomeTextFieldFocusNode?.dispose();
    otherIncomeTextFieldTextController?.dispose();
  }
}
