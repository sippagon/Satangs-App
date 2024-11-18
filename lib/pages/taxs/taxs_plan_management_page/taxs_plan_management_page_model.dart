import '/flutter_flow/flutter_flow_util.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'taxs_plan_management_page_widget.dart'
    show TaxsPlanManagementPageWidget;
import 'package:flutter/material.dart';

class TaxsPlanManagementPageModel
    extends FlutterFlowModel<TaxsPlanManagementPageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? taxManagementPageController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taxManagementPageController?.finish();
  }
}
