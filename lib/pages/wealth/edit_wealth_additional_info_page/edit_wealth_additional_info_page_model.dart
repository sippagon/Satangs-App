import '/flutter_flow/flutter_flow_util.dart';
import 'edit_wealth_additional_info_page_widget.dart'
    show EditWealthAdditionalInfoPageWidget;
import 'package:flutter/material.dart';

class EditWealthAdditionalInfoPageModel
    extends FlutterFlowModel<EditWealthAdditionalInfoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for YearlyExpenseField widget.
  FocusNode? yearlyExpenseFieldFocusNode;
  TextEditingController? yearlyExpenseFieldTextController;
  String? Function(BuildContext, String?)?
      yearlyExpenseFieldTextControllerValidator;
  String? _yearlyExpenseFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุรายจ่ายต่อปี';
    }

    return null;
  }

  // State field(s) for IncomeGrowthField widget.
  FocusNode? incomeGrowthFieldFocusNode;
  TextEditingController? incomeGrowthFieldTextController;
  String? Function(BuildContext, String?)?
      incomeGrowthFieldTextControllerValidator;
  String? _incomeGrowthFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุอัตราการเติบโตของรายได้';
    }

    return null;
  }

  // State field(s) for AssetsGrowthField widget.
  FocusNode? assetsGrowthFieldFocusNode;
  TextEditingController? assetsGrowthFieldTextController;
  String? Function(BuildContext, String?)?
      assetsGrowthFieldTextControllerValidator;
  // State field(s) for InflationGrowthField widget.
  FocusNode? inflationGrowthFieldFocusNode;
  TextEditingController? inflationGrowthFieldTextController;
  String? Function(BuildContext, String?)?
      inflationGrowthFieldTextControllerValidator;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValid;

  @override
  void initState(BuildContext context) {
    yearlyExpenseFieldTextControllerValidator =
        _yearlyExpenseFieldTextControllerValidator;
    incomeGrowthFieldTextControllerValidator =
        _incomeGrowthFieldTextControllerValidator;
  }

  @override
  void dispose() {
    yearlyExpenseFieldFocusNode?.dispose();
    yearlyExpenseFieldTextController?.dispose();

    incomeGrowthFieldFocusNode?.dispose();
    incomeGrowthFieldTextController?.dispose();

    assetsGrowthFieldFocusNode?.dispose();
    assetsGrowthFieldTextController?.dispose();

    inflationGrowthFieldFocusNode?.dispose();
    inflationGrowthFieldTextController?.dispose();
  }
}
