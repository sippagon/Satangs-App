import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'taxes_donate_deduct_form_page_widget.dart'
    show TaxesDonateDeductFormPageWidget;
import 'package:flutter/material.dart';

class TaxesDonateDeductFormPageModel
    extends FlutterFlowModel<TaxesDonateDeductFormPageWidget> {
  ///  Local state fields for this page.

  TaxesDeductionStruct? deductionViewModel;
  void updateDeductionViewModelStruct(Function(TaxesDeductionStruct) updateFn) {
    updateFn(deductionViewModel ??= TaxesDeductionStruct());
  }

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Custom Action - getIndexFromGuid] action in TaxesDonateDeductFormPage widget.
  int? updateIndex;
  // State field(s) for GeneralDonateTextField widget.
  FocusNode? generalDonateTextFieldFocusNode;
  TextEditingController? generalDonateTextFieldTextController;
  String? Function(BuildContext, String?)?
      generalDonateTextFieldTextControllerValidator;
  // State field(s) for OtherDonateTextField widget.
  FocusNode? otherDonateTextFieldFocusNode;
  TextEditingController? otherDonateTextFieldTextController;
  String? Function(BuildContext, String?)?
      otherDonateTextFieldTextControllerValidator;
  // State field(s) for PartyDonateTextField widget.
  FocusNode? partyDonateTextFieldFocusNode;
  TextEditingController? partyDonateTextFieldTextController;
  String? Function(BuildContext, String?)?
      partyDonateTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    generalDonateTextFieldFocusNode?.dispose();
    generalDonateTextFieldTextController?.dispose();

    otherDonateTextFieldFocusNode?.dispose();
    otherDonateTextFieldTextController?.dispose();

    partyDonateTextFieldFocusNode?.dispose();
    partyDonateTextFieldTextController?.dispose();
  }
}
