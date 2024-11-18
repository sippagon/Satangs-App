import '/backend/schema/structs/index.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'statistic_page_widget.dart' show StatisticPageWidget;
import 'package:flutter/material.dart';

class StatisticPageModel extends FlutterFlowModel<StatisticPageWidget> {
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

  List<DonutChartDataStruct> incomePieChartData = [];
  void addToIncomePieChartData(DonutChartDataStruct item) =>
      incomePieChartData.add(item);
  void removeFromIncomePieChartData(DonutChartDataStruct item) =>
      incomePieChartData.remove(item);
  void removeAtIndexFromIncomePieChartData(int index) =>
      incomePieChartData.removeAt(index);
  void insertAtIndexInIncomePieChartData(
          int index, DonutChartDataStruct item) =>
      incomePieChartData.insert(index, item);
  void updateIncomePieChartDataAtIndex(
          int index, Function(DonutChartDataStruct) updateFn) =>
      incomePieChartData[index] = updateFn(incomePieChartData[index]);

  List<DonutChartDataStruct> expensePieChartData = [];
  void addToExpensePieChartData(DonutChartDataStruct item) =>
      expensePieChartData.add(item);
  void removeFromExpensePieChartData(DonutChartDataStruct item) =>
      expensePieChartData.remove(item);
  void removeAtIndexFromExpensePieChartData(int index) =>
      expensePieChartData.removeAt(index);
  void insertAtIndexInExpensePieChartData(
          int index, DonutChartDataStruct item) =>
      expensePieChartData.insert(index, item);
  void updateExpensePieChartDataAtIndex(
          int index, Function(DonutChartDataStruct) updateFn) =>
      expensePieChartData[index] = updateFn(expensePieChartData[index]);

  List<DateTime> dateRangeFilter = [];
  void addToDateRangeFilter(DateTime item) => dateRangeFilter.add(item);
  void removeFromDateRangeFilter(DateTime item) => dateRangeFilter.remove(item);
  void removeAtIndexFromDateRangeFilter(int index) =>
      dateRangeFilter.removeAt(index);
  void insertAtIndexInDateRangeFilter(int index, DateTime item) =>
      dateRangeFilter.insert(index, item);
  void updateDateRangeFilterAtIndex(int index, Function(DateTime) updateFn) =>
      dateRangeFilter[index] = updateFn(dateRangeFilter[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? reportPageController;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in StatisticPage widget.
  List<DateTime>? initDateRangeResult;
  // Stores action output result for [Custom Action - mapTransactionToPieChartData] action in StatisticPage widget.
  List<DonutChartDataStruct>? initIncomePieChartData;
  // Stores action output result for [Custom Action - mapTransactionToPieChartData] action in StatisticPage widget.
  List<DonutChartDataStruct>? initExpensePieChartData;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Custom Action - showCustomDateRange] action in ChoiceChips widget.
  List<DateTime>? customDateRangeResult;
  // Stores action output result for [Custom Action - getFilterDateRangeValue] action in ChoiceChips widget.
  List<DateTime>? selectedDateRangeResult;
  // Stores action output result for [Custom Action - mapTransactionToPieChartData] action in ChoiceChips widget.
  List<DonutChartDataStruct>? filterIncomePieChartData;
  // Stores action output result for [Custom Action - mapTransactionToPieChartData] action in ChoiceChips widget.
  List<DonutChartDataStruct>? filterExpensePieChartData;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for EmptyListItems component.
  late EmptyListItemsModel emptyListItemsModel1;
  // Model for EmptyListItems component.
  late EmptyListItemsModel emptyListItemsModel2;

  @override
  void initState(BuildContext context) {
    emptyListItemsModel1 = createModel(context, () => EmptyListItemsModel());
    emptyListItemsModel2 = createModel(context, () => EmptyListItemsModel());
  }

  @override
  void dispose() {
    reportPageController?.finish();
    tabBarController?.dispose();
    emptyListItemsModel1.dispose();
    emptyListItemsModel2.dispose();
  }
}
