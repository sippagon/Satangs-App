import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'goal_details_page_widget.dart' show GoalDetailsPageWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class GoalDetailsPageModel extends FlutterFlowModel<GoalDetailsPageWidget> {
  ///  Local state fields for this page.

  GoalStruct? goalData;
  void updateGoalDataStruct(Function(GoalStruct) updateFn) {
    updateFn(goalData ??= GoalStruct());
  }

  List<GoalMonthSavingDataTableStruct> savingTableData = [];
  void addToSavingTableData(GoalMonthSavingDataTableStruct item) =>
      savingTableData.add(item);
  void removeFromSavingTableData(GoalMonthSavingDataTableStruct item) =>
      savingTableData.remove(item);
  void removeAtIndexFromSavingTableData(int index) =>
      savingTableData.removeAt(index);
  void insertAtIndexInSavingTableData(
          int index, GoalMonthSavingDataTableStruct item) =>
      savingTableData.insert(index, item);
  void updateSavingTableDataAtIndex(
          int index, Function(GoalMonthSavingDataTableStruct) updateFn) =>
      savingTableData[index] = updateFn(savingTableData[index]);

  List<double> requireInterestResults = [];
  void addToRequireInterestResults(double item) =>
      requireInterestResults.add(item);
  void removeFromRequireInterestResults(double item) =>
      requireInterestResults.remove(item);
  void removeAtIndexFromRequireInterestResults(int index) =>
      requireInterestResults.removeAt(index);
  void insertAtIndexInRequireInterestResults(int index, double item) =>
      requireInterestResults.insert(index, item);
  void updateRequireInterestResultsAtIndex(
          int index, Function(double) updateFn) =>
      requireInterestResults[index] = updateFn(requireInterestResults[index]);

  bool possibleSuccess = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? goalDetailPageController;
  // Stores action output result for [Custom Action - calculateGoalSavingDatatable] action in GoalDetailsPage widget.
  List<GoalMonthSavingDataTableStruct>? initalSavingDataTable;
  // Stores action output result for [Custom Action - calculateGoalRequiredInterestRate] action in GoalDetailsPage widget.
  List<double>? requireInterestResult;
  // Stores action output result for [Bottom Sheet - GoalAddAmount] action in Button widget.
  bool? submited;
  // Stores action output result for [Custom Action - calculateGoalSavingDatatable] action in Button widget.
  List<GoalMonthSavingDataTableStruct>? adjustSavingDatatable;
  // Stores action output result for [Custom Action - calculateGoalRequiredInterestRate] action in Button widget.
  List<double>? adjustRequireInterestResult;
  // Stores action output result for [Bottom Sheet - DeleteConfirmation] action in IconButton widget.
  bool? confirmResult;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    goalDetailPageController?.finish();
  }
}
