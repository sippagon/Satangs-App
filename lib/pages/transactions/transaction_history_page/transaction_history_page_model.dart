import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'transaction_history_page_widget.dart' show TransactionHistoryPageWidget;
import 'package:flutter/material.dart';

class TransactionHistoryPageModel
    extends FlutterFlowModel<TransactionHistoryPageWidget> {
  ///  Local state fields for this page.

  List<TransactionStruct> filterTransactions = [];
  void addToFilterTransactions(TransactionStruct item) =>
      filterTransactions.add(item);
  void removeFromFilterTransactions(TransactionStruct item) =>
      filterTransactions.remove(item);
  void removeAtIndexFromFilterTransactions(int index) =>
      filterTransactions.removeAt(index);
  void insertAtIndexInFilterTransactions(int index, TransactionStruct item) =>
      filterTransactions.insert(index, item);
  void updateFilterTransactionsAtIndex(
          int index, Function(TransactionStruct) updateFn) =>
      filterTransactions[index] = updateFn(filterTransactions[index]);

  List<DateTime> dateRangeValue = [];
  void addToDateRangeValue(DateTime item) => dateRangeValue.add(item);
  void removeFromDateRangeValue(DateTime item) => dateRangeValue.remove(item);
  void removeAtIndexFromDateRangeValue(int index) =>
      dateRangeValue.removeAt(index);
  void insertAtIndexInDateRangeValue(int index, DateTime item) =>
      dateRangeValue.insert(index, item);
  void updateDateRangeValueAtIndex(int index, Function(DateTime) updateFn) =>
      dateRangeValue[index] = updateFn(dateRangeValue[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? transactionHistoryPageController;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in TransactionHistoryPage widget.
  List<DateTime>? dateRangeResults;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - showCustomDateRange] action in ChoiceChips widget.
  List<DateTime>? outputDateRange;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in ChoiceChips widget.
  List<DateTime>? selectedDateRange;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    transactionHistoryPageController?.finish();
  }
}
