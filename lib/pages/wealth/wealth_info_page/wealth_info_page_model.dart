import '/backend/schema/structs/index.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'wealth_info_page_widget.dart' show WealthInfoPageWidget;
import 'package:flutter/material.dart';

class WealthInfoPageModel extends FlutterFlowModel<WealthInfoPageWidget> {
  ///  Local state fields for this page.

  WealthInfoViewModelStruct? viewModel;
  void updateViewModelStruct(Function(WealthInfoViewModelStruct) updateFn) {
    updateFn(viewModel ??= WealthInfoViewModelStruct());
  }

  List<WealthLineChartDataStruct> chartModel = [];
  void addToChartModel(WealthLineChartDataStruct item) => chartModel.add(item);
  void removeFromChartModel(WealthLineChartDataStruct item) =>
      chartModel.remove(item);
  void removeAtIndexFromChartModel(int index) => chartModel.removeAt(index);
  void insertAtIndexInChartModel(int index, WealthLineChartDataStruct item) =>
      chartModel.insert(index, item);
  void updateChartModelAtIndex(
          int index, Function(WealthLineChartDataStruct) updateFn) =>
      chartModel[index] = updateFn(chartModel[index]);

  WealthCalculateResultModelStruct? calculateModel;
  void updateCalculateModelStruct(
      Function(WealthCalculateResultModelStruct) updateFn) {
    updateFn(calculateModel ??= WealthCalculateResultModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? wealthInfoPageController;
  // Stores action output result for [Custom Action - calculateWealthInfo] action in WealthInfoPage widget.
  WealthInfoViewModelStruct? result;
  // Stores action output result for [Custom Action - predictFutureWealthBasedOnAge] action in WealthInfoPage widget.
  List<WealthLineChartDataStruct>? chartResults;
  // Stores action output result for [Custom Action - calculateWealthCompassBasedOnAge] action in WealthInfoPage widget.
  WealthCalculateResultModelStruct? initalCalResults;
  // Model for EmptyListItems component.
  late EmptyListItemsModel emptyListItemsModel;
  // State field(s) for Slider widget.
  double? sliderValue;
  // Stores action output result for [Custom Action - calculateWealthCompassBasedOnAge] action in Slider widget.
  WealthCalculateResultModelStruct? calculateResults;

  @override
  void initState(BuildContext context) {
    emptyListItemsModel = createModel(context, () => EmptyListItemsModel());
  }

  @override
  void dispose() {
    wealthInfoPageController?.finish();
    emptyListItemsModel.dispose();
  }
}
