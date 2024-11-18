import '/flutter_flow/flutter_flow_util.dart';
import 'account_page_widget.dart' show AccountPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class AccountPageModel extends FlutterFlowModel<AccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? accountPageController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    accountPageController?.finish();
  }
}
