import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_trans_page_widget.dart' show AddTransPageWidget;
import 'package:flutter/material.dart';

class AddTransPageModel extends FlutterFlowModel<AddTransPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for CategoryDD widget.
  String? categoryDDValue;
  FormFieldController<String>? categoryDDValueController;
  // State field(s) for AccDD widget.
  String? accDDValue;
  FormFieldController<String>? accDDValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาระบุจำนวนเงิน';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาเลือกวันเวลาที่ทำรายการ';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Custom Action - createRandomUuid] action in Button widget.
  String? generatedGuid;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? currentBalance;
  // Stores action output result for [Custom Action - getAccountIndexByGuid] action in Button widget.
  int? accountIndex;

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
