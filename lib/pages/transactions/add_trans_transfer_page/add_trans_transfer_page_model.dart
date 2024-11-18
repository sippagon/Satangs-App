import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_trans_transfer_page_widget.dart' show AddTransTransferPageWidget;
import 'package:flutter/material.dart';

class AddTransTransferPageModel
    extends FlutterFlowModel<AddTransTransferPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for AccDD widget.
  String? accDDValue;
  FormFieldController<String>? accDDValueController;
  // State field(s) for AccTargetDD widget.
  String? accTargetDDValue;
  FormFieldController<String>? accTargetDDValueController;
  // State field(s) for AmountTextField widget.
  FocusNode? amountTextFieldFocusNode;
  TextEditingController? amountTextFieldTextController;
  String? Function(BuildContext, String?)?
      amountTextFieldTextControllerValidator;
  String? _amountTextFieldTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาระบุจำนวนเงิน';
    }

    return null;
  }

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'กรุณาระบุวันเวลาที่ทำรายการ';
    }

    return null;
  }

  DateTime? datePicked;
  // Stores action output result for [Custom Action - createRandomUuid] action in Button widget.
  String? generatedGuid;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? currBalance;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? accIndex;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? currTargetBalance;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? accTargetIndex;

  @override
  void initState(BuildContext context) {
    amountTextFieldTextControllerValidator =
        _amountTextFieldTextControllerValidator;
    textController2Validator = _textController2Validator;
  }

  @override
  void dispose() {
    amountTextFieldFocusNode?.dispose();
    amountTextFieldTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
