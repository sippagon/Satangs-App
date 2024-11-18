import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  DateTime? endOfCurrMonth;

  DateTime? startOfCurrMonth;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? homePageController;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in HomePage widget.
  List<DateTime>? initalOneMonthDateRange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    homePageController?.finish();
  }
}
