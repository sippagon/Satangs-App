import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'budget_allocate_form_input_model.dart';
export 'budget_allocate_form_input_model.dart';

class BudgetAllocateFormInputWidget extends StatefulWidget {
  const BudgetAllocateFormInputWidget({
    super.key,
    required this.updateIndex,
    required this.elementGuid,
    this.initValue,
  });

  final int? updateIndex;
  final String? elementGuid;
  final double? initValue;

  @override
  State<BudgetAllocateFormInputWidget> createState() =>
      _BudgetAllocateFormInputWidgetState();
}

class _BudgetAllocateFormInputWidgetState
    extends State<BudgetAllocateFormInputWidget> {
  late BudgetAllocateFormInputModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BudgetAllocateFormInputModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.budgetCategoryData = FFAppState()
          .TempBudgetFormInput
          .includeCategories[widget.updateIndex!];
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController(
        text: widget.initValue! > 0.0
            ? formatNumber(
                widget.initValue,
                formatType: FormatType.custom,
                format: '#.##',
                locale: '',
              )
            : null);
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                valueOrDefault<String>(
                  _model.budgetCategoryData?.name,
                  'หมวดหมู่',
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Prompt',
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    const Duration(milliseconds: 1),
                    () async {
                      FFAppState().updateTempBudgetFormInputStruct(
                        (e) => e
                          ..updateIncludeCategories(
                            (e) => e[widget.updateIndex!]
                              ..amount =
                                  double.tryParse(_model.textController.text),
                          ),
                      );
                      _model.updatePage(() {});
                    },
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Prompt',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                    hintText: 'โปรดระบุจำนวนเงิน.....',
                    hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                              fontFamily: 'Prompt',
                              fontSize: 16.0,
                              letterSpacing: 0.0,
                            ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Prompt',
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  maxLength: 30,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  buildCounter: (context,
                          {required currentLength,
                          required isFocused,
                          maxLength}) =>
                      null,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  validator:
                      _model.textControllerValidator.asValidator(context),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp('^\\d+(\\.\\d{0,2})?\$'))
                  ],
                ),
              ),
            ],
          ),
        ].divide(const SizedBox(height: 5.0)),
      ),
    );
  }
}
