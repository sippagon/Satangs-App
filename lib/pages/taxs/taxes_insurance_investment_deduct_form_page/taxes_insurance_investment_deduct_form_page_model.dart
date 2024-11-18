import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'taxes_insurance_investment_deduct_form_page_widget.dart'
    show TaxesInsuranceInvestmentDeductFormPageWidget;
import 'package:flutter/material.dart';

class TaxesInsuranceInvestmentDeductFormPageModel
    extends FlutterFlowModel<TaxesInsuranceInvestmentDeductFormPageWidget> {
  ///  Local state fields for this page.

  TaxesDeductionStruct? deductionViewModel;
  void updateDeductionViewModelStruct(Function(TaxesDeductionStruct) updateFn) {
    updateFn(deductionViewModel ??= TaxesDeductionStruct());
  }

  double incomeMax30 = 0.0;

  double incomeMax15 = 0.0;

  bool group100kError = false;

  bool group500kError = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - getIndexFromGuid] action in TaxesInsuranceInvestmentDeductFormPage widget.
  int? updateIndex;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for HealthInsuranceTextField widget.
  FocusNode? healthInsuranceTextFieldFocusNode;
  TextEditingController? healthInsuranceTextFieldTextController;
  String? Function(BuildContext, String?)?
      healthInsuranceTextFieldTextControllerValidator;
  // State field(s) for LifeInsuranceTextField widget.
  FocusNode? lifeInsuranceTextFieldFocusNode;
  TextEditingController? lifeInsuranceTextFieldTextController;
  String? Function(BuildContext, String?)?
      lifeInsuranceTextFieldTextControllerValidator;
  // State field(s) for SocialSecurityTextField widget.
  FocusNode? socialSecurityTextFieldFocusNode;
  TextEditingController? socialSecurityTextFieldTextController;
  String? Function(BuildContext, String?)?
      socialSecurityTextFieldTextControllerValidator;
  // State field(s) for ParentInsuranceTextField widget.
  FocusNode? parentInsuranceTextFieldFocusNode;
  TextEditingController? parentInsuranceTextFieldTextController;
  String? Function(BuildContext, String?)?
      parentInsuranceTextFieldTextControllerValidator;
  // State field(s) for PensionTextField widget.
  FocusNode? pensionTextFieldFocusNode;
  TextEditingController? pensionTextFieldTextController;
  String? Function(BuildContext, String?)?
      pensionTextFieldTextControllerValidator;
  // State field(s) for RMFTextField widget.
  FocusNode? rMFTextFieldFocusNode;
  TextEditingController? rMFTextFieldTextController;
  String? Function(BuildContext, String?)? rMFTextFieldTextControllerValidator;
  // State field(s) for SSFTextField widget.
  FocusNode? sSFTextFieldFocusNode;
  TextEditingController? sSFTextFieldTextController;
  String? Function(BuildContext, String?)? sSFTextFieldTextControllerValidator;
  // State field(s) for PVDTextField widget.
  FocusNode? pVDTextFieldFocusNode;
  TextEditingController? pVDTextFieldTextController;
  String? Function(BuildContext, String?)? pVDTextFieldTextControllerValidator;
  // State field(s) for GPFTextField widget.
  FocusNode? gPFTextFieldFocusNode;
  TextEditingController? gPFTextFieldTextController;
  String? Function(BuildContext, String?)? gPFTextFieldTextControllerValidator;
  // State field(s) for NSFTextField widget.
  FocusNode? nSFTextFieldFocusNode;
  TextEditingController? nSFTextFieldTextController;
  String? Function(BuildContext, String?)? nSFTextFieldTextControllerValidator;
  // Stores action output result for [Custom Action - validateTaxDeductMaxInsurance] action in Button widget.
  bool? validateInsuranceResult;
  // Stores action output result for [Custom Action - validateTaxDeductMaxInvestment] action in Button widget.
  bool? validateInvestmentResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    healthInsuranceTextFieldFocusNode?.dispose();
    healthInsuranceTextFieldTextController?.dispose();

    lifeInsuranceTextFieldFocusNode?.dispose();
    lifeInsuranceTextFieldTextController?.dispose();

    socialSecurityTextFieldFocusNode?.dispose();
    socialSecurityTextFieldTextController?.dispose();

    parentInsuranceTextFieldFocusNode?.dispose();
    parentInsuranceTextFieldTextController?.dispose();

    pensionTextFieldFocusNode?.dispose();
    pensionTextFieldTextController?.dispose();

    rMFTextFieldFocusNode?.dispose();
    rMFTextFieldTextController?.dispose();

    sSFTextFieldFocusNode?.dispose();
    sSFTextFieldTextController?.dispose();

    pVDTextFieldFocusNode?.dispose();
    pVDTextFieldTextController?.dispose();

    gPFTextFieldFocusNode?.dispose();
    gPFTextFieldTextController?.dispose();

    nSFTextFieldFocusNode?.dispose();
    nSFTextFieldTextController?.dispose();
  }
}
