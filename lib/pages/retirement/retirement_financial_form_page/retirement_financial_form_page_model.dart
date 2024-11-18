import '/flutter_flow/flutter_flow_util.dart';
import 'retirement_financial_form_page_widget.dart'
    show RetirementFinancialFormPageWidget;
import 'package:flutter/material.dart';

class RetirementFinancialFormPageModel
    extends FlutterFlowModel<RetirementFinancialFormPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getYearlyIncome] action in RetirementFinancialFormPage widget.
  double? predictYearlyIncome;
  // Stores action output result for [Custom Action - getYearlyExpense] action in RetirementFinancialFormPage widget.
  double? predictYearlyExpense;
  // State field(s) for YearlyIncomeField widget.
  FocusNode? yearlyIncomeFieldFocusNode;
  TextEditingController? yearlyIncomeFieldTextController;
  String? Function(BuildContext, String?)?
      yearlyIncomeFieldTextControllerValidator;
  String? _yearlyIncomeFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุรายได้ต่อปี';
    }

    return null;
  }

  // State field(s) for YearlyExpenseField widget.
  FocusNode? yearlyExpenseFieldFocusNode;
  TextEditingController? yearlyExpenseFieldTextController;
  String? Function(BuildContext, String?)?
      yearlyExpenseFieldTextControllerValidator;
  // State field(s) for IncomeGrowthField widget.
  FocusNode? incomeGrowthFieldFocusNode;
  TextEditingController? incomeGrowthFieldTextController;
  String? Function(BuildContext, String?)?
      incomeGrowthFieldTextControllerValidator;
  String? _incomeGrowthFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุอัตราเติบโตของรายได้ (ปกติอยู่ที่ 2%)';
    }

    return null;
  }

  // State field(s) for InflationGrowthField widget.
  FocusNode? inflationGrowthFieldFocusNode;
  TextEditingController? inflationGrowthFieldTextController;
  String? Function(BuildContext, String?)?
      inflationGrowthFieldTextControllerValidator;
  String? _inflationGrowthFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุอัตราเงินเฟ้า (ปกติอยู่ที่ 3%)';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    yearlyIncomeFieldTextControllerValidator =
        _yearlyIncomeFieldTextControllerValidator;
    incomeGrowthFieldTextControllerValidator =
        _incomeGrowthFieldTextControllerValidator;
    inflationGrowthFieldTextControllerValidator =
        _inflationGrowthFieldTextControllerValidator;
  }

  @override
  void dispose() {
    yearlyIncomeFieldFocusNode?.dispose();
    yearlyIncomeFieldTextController?.dispose();

    yearlyExpenseFieldFocusNode?.dispose();
    yearlyExpenseFieldTextController?.dispose();

    incomeGrowthFieldFocusNode?.dispose();
    incomeGrowthFieldTextController?.dispose();

    inflationGrowthFieldFocusNode?.dispose();
    inflationGrowthFieldTextController?.dispose();
  }
}
