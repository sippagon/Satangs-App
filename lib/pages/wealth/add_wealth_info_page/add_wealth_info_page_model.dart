import '/flutter_flow/flutter_flow_util.dart';
import 'add_wealth_info_page_widget.dart' show AddWealthInfoPageWidget;
import 'package:flutter/material.dart';

class AddWealthInfoPageModel extends FlutterFlowModel<AddWealthInfoPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getYearlyIncome] action in AddWealthInfoPage widget.
  double? predictYearIncome;
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

  // State field(s) for TotalAssetField widget.
  FocusNode? totalAssetFieldFocusNode;
  TextEditingController? totalAssetFieldTextController;
  String? Function(BuildContext, String?)?
      totalAssetFieldTextControllerValidator;
  String? _totalAssetFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุจำนวนทรัพย์สินที่คุณมี';
    }

    return null;
  }

  // State field(s) for TotalDebtField widget.
  FocusNode? totalDebtFieldFocusNode;
  TextEditingController? totalDebtFieldTextController;
  String? Function(BuildContext, String?)?
      totalDebtFieldTextControllerValidator;
  String? _totalDebtFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุหนี้สินที่คุณมี';
    }

    return null;
  }

  // State field(s) for DateOfBirthField widget.
  FocusNode? dateOfBirthFieldFocusNode;
  TextEditingController? dateOfBirthFieldTextController;
  String? Function(BuildContext, String?)?
      dateOfBirthFieldTextControllerValidator;
  String? _dateOfBirthFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุวันเกิดของคุณ';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? isValid;

  @override
  void initState(BuildContext context) {
    yearlyIncomeFieldTextControllerValidator =
        _yearlyIncomeFieldTextControllerValidator;
    totalAssetFieldTextControllerValidator =
        _totalAssetFieldTextControllerValidator;
    totalDebtFieldTextControllerValidator =
        _totalDebtFieldTextControllerValidator;
    dateOfBirthFieldTextControllerValidator =
        _dateOfBirthFieldTextControllerValidator;
  }

  @override
  void dispose() {
    yearlyIncomeFieldFocusNode?.dispose();
    yearlyIncomeFieldTextController?.dispose();

    totalAssetFieldFocusNode?.dispose();
    totalAssetFieldTextController?.dispose();

    totalDebtFieldFocusNode?.dispose();
    totalDebtFieldTextController?.dispose();

    dateOfBirthFieldFocusNode?.dispose();
    dateOfBirthFieldTextController?.dispose();
  }
}
