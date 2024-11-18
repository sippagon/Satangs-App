import '/flutter_flow/flutter_flow_util.dart';
import 'edit_taxes_page_widget.dart' show EditTaxesPageWidget;
import 'package:flutter/material.dart';

class EditTaxesPageModel extends FlutterFlowModel<EditTaxesPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getIndexFromGuid] action in EditTaxesPage widget.
  int? updateIndex;
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
  // Stores action output result for [Custom Action - validateDuplicateName] action in Button widget.
  bool? validName;

  @override
  void initState(BuildContext context) {
    nameTextFieldTextControllerValidator =
        _nameTextFieldTextControllerValidator;
    taxYearTextFieldTextControllerValidator =
        _taxYearTextFieldTextControllerValidator;
  }

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    taxYearTextFieldFocusNode?.dispose();
    taxYearTextFieldTextController?.dispose();
  }
}
