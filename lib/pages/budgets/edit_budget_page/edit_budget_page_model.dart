import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_budget_page_widget.dart' show EditBudgetPageWidget;
import 'package:flutter/material.dart';

class EditBudgetPageModel extends FlutterFlowModel<EditBudgetPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุชื่อแผน';
    }

    if (!RegExp('^(?!\\s*\$).+').hasMatch(val)) {
      return 'ไม่สามารถใส่ค่าว่างได้';
    }
    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุงบประมาณ';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // Stores action output result for [Custom Action - validateDuplicateName] action in Button widget.
  bool? validName;
  // Stores action output result for [Custom Action - mapCategoriesToUpdateBudgetCats] action in Button widget.
  List<BudgetTrasactionCategoriesStruct>? updateBudgetCatLists;

  @override
  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
