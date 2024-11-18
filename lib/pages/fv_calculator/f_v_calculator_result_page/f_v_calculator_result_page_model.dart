import '/backend/schema/structs/index.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f_v_calculator_result_page_widget.dart'
    show FVCalculatorResultPageWidget;
import 'package:flutter/material.dart';

class FVCalculatorResultPageModel
    extends FlutterFlowModel<FVCalculatorResultPageWidget> {
  ///  Local state fields for this page.

  FVOutputModelStruct? viewModel;
  void updateViewModelStruct(Function(FVOutputModelStruct) updateFn) {
    updateFn(viewModel ??= FVOutputModelStruct());
  }

  ///  State fields for stateful widgets in this page.

  // Model for EmptyListItems component.
  late EmptyListItemsModel emptyListItemsModel;

  @override
  void initState(BuildContext context) {
    emptyListItemsModel = createModel(context, () => EmptyListItemsModel());
  }

  @override
  void dispose() {
    emptyListItemsModel.dispose();
  }
}
