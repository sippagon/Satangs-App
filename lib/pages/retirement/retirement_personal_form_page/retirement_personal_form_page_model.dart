import '/flutter_flow/flutter_flow_util.dart';
import 'retirement_personal_form_page_widget.dart'
    show RetirementPersonalFormPageWidget;
import 'package:flutter/material.dart';

class RetirementPersonalFormPageModel
    extends FlutterFlowModel<RetirementPersonalFormPageWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
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
  // State field(s) for RetirementAgeSlider widget.
  double? retirementAgeSliderValue;
  // State field(s) for LifeExpectedAgeSlider widget.
  double? lifeExpectedAgeSliderValue;

  @override
  void initState(BuildContext context) {
    dateOfBirthFieldTextControllerValidator =
        _dateOfBirthFieldTextControllerValidator;
  }

  @override
  void dispose() {
    dateOfBirthFieldFocusNode?.dispose();
    dateOfBirthFieldTextController?.dispose();
  }
}
