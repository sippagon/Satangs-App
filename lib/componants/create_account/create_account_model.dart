import '/flutter_flow/flutter_flow_util.dart';
import 'create_account_widget.dart' show CreateAccountWidget;
import 'package:flutter/material.dart';

class CreateAccountModel extends FlutterFlowModel<CreateAccountWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุชื่อบัญชี';
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
      return 'โปรดระบุจำนวนเงินเริ่มต้น';
    }

    return null;
  }

  // Stores action output result for [Custom Action - validateDuplicateName] action in Button widget.
  bool? validateDuplicateName;
  // Stores action output result for [Custom Action - createRandomUuid] action in Button widget.
  String? newGuid;

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
