import '/flutter_flow/flutter_flow_util.dart';
import 'goal_and_budget_page_widget.dart' show GoalAndBudgetPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class GoalAndBudgetPageModel extends FlutterFlowModel<GoalAndBudgetPageWidget> {
  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? goalAndBudgetPageController;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in GoalAndBudgetPage widget.
  List<DateTime>? oneMonthDateRange;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    goalAndBudgetPageController?.finish();
    tabBarController?.dispose();
  }
}
