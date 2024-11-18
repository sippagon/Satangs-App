import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'taxes_personal_info_form_page_widget.dart'
    show TaxesPersonalInfoFormPageWidget;
import 'package:flutter/material.dart';

class TaxesPersonalInfoFormPageModel
    extends FlutterFlowModel<TaxesPersonalInfoFormPageWidget> {
  ///  Local state fields for this page.

  TaxesStruct? viewModel;
  void updateViewModelStruct(Function(TaxesStruct) updateFn) {
    updateFn(viewModel ??= TaxesStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getIndexFromGuid] action in TaxesPersonalInfoFormPage widget.
  int? updateIndex;
  // State field(s) for MaritalStatusRadioButton widget.
  FormFieldController<String>? maritalStatusRadioButtonValueController;
  // State field(s) for ParentsCheckboxGroup widget.
  FormFieldController<List<String>>? parentsCheckboxGroupValueController;
  List<String>? get parentsCheckboxGroupValues =>
      parentsCheckboxGroupValueController?.value;
  set parentsCheckboxGroupValues(List<String>? v) =>
      parentsCheckboxGroupValueController?.value = v;

  // State field(s) for ChildSlider widget.
  double? childSliderValue;
  // State field(s) for DisablePeopleRadioButton widget.
  FormFieldController<String>? disablePeopleRadioButtonValueController;
  // State field(s) for DisablePeopleSlider widget.
  double? disablePeopleSliderValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  String? get maritalStatusRadioButtonValue =>
      maritalStatusRadioButtonValueController?.value;
  String? get disablePeopleRadioButtonValue =>
      disablePeopleRadioButtonValueController?.value;
}
