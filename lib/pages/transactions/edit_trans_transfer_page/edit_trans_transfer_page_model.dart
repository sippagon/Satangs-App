import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_trans_transfer_page_widget.dart' show EditTransTransferPageWidget;
import 'package:flutter/material.dart';

class EditTransTransferPageModel
    extends FlutterFlowModel<EditTransTransferPageWidget> {
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
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? updateIndex;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? updateAccountIndex;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? updateCurrBalance;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? updateTargetAccountIndex;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? updateCurrTargetBalance;
  // Stores action output result for [Bottom Sheet - DeleteConfirmation] action in Button widget.
  bool? confirm;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? deleteIndex;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? accountIndex;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? currBalance;
  // Stores action output result for [Custom Action - getIndexFromGuid] action in Button widget.
  int? targetAccountIndex;
  // Stores action output result for [Custom Action - updateCurrentBalance] action in Button widget.
  double? currTargetBalance;

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
