import '/flutter_flow/flutter_flow_util.dart';
import 'goal_add_amount_widget.dart' show GoalAddAmountWidget;
import 'package:flutter/material.dart';

class GoalAddAmountModel extends FlutterFlowModel<GoalAddAmountWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'โปรดระบุจำนวนเงินเริ่มต้น';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
