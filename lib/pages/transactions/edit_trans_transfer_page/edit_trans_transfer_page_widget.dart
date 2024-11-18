import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/componants/delete_confirmation/delete_confirmation_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'edit_trans_transfer_page_model.dart';
export 'edit_trans_transfer_page_model.dart';

class EditTransTransferPageWidget extends StatefulWidget {
  const EditTransTransferPageWidget({
    super.key,
    this.transactionData,
  });

  final TransactionStruct? transactionData;

  @override
  State<EditTransTransferPageWidget> createState() =>
      _EditTransTransferPageWidgetState();
}

class _EditTransTransferPageWidgetState
    extends State<EditTransTransferPageWidget> {
  late EditTransTransferPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditTransTransferPageModel());

    _model.amountTextFieldTextController ??= TextEditingController(
        text: widget.transactionData?.amount.toString());
    _model.amountTextFieldFocusNode ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.textController2?.text = dateTimeFormat(
            "d/M/y H:mm",
            widget.transactionData?.date,
            locale: FFLocalizations.of(context).languageCode,
          );
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(110.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            actions: const [],
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.chevron_left,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'แก้ไขรายการโอนเงิน',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Kanit',
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              expandedTitleScale: 1.0,
            ),
            elevation: 0.0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Form(
                                    key: _model.formKey,
                                    autovalidateMode: AutovalidateMode.disabled,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'บัญชีต้นทาง',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
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
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .accDDValueController ??=
                                                    FormFieldController<String>(
                                                  _model.accDDValue ??= widget
                                                      .transactionData
                                                      ?.accountId,
                                                ),
                                                options: List<String>.from(
                                                    FFAppState()
                                                        .AccountList
                                                        .where((e) => e.active)
                                                        .toList()
                                                        .map((e) => e.guid)
                                                        .toList()),
                                                optionLabels: FFAppState()
                                                    .AccountList
                                                    .where((e) => e.active)
                                                    .toList()
                                                    .map((e) => e.name)
                                                    .toList(),
                                                onChanged: (val) async {
                                                  safeSetState(() =>
                                                      _model.accDDValue = val);
                                                  if (_model.accTargetDDValue !=
                                                          null &&
                                                      _model.accTargetDDValue !=
                                                          '') {
                                                    if (_model.accDDValue ==
                                                        _model
                                                            .accTargetDDValue) {
                                                      safeSetState(() {
                                                        _model
                                                            .accTargetDDValueController
                                                            ?.reset();
                                                      });
                                                      return;
                                                    } else {
                                                      return;
                                                    }
                                                  } else {
                                                    return;
                                                  }
                                                },
                                                width: 300.0,
                                                height: 56.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'โปรดเลือกบัญชี',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 1.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 1.0,
                                                borderRadius: 5.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                                labelText: '',
                                                labelTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'บัญชีปลายทาง',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child:
                                                  FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .accTargetDDValueController ??=
                                                    FormFieldController<String>(
                                                  _model.accTargetDDValue ??=
                                                      widget.transactionData
                                                          ?.targetAccountId,
                                                ),
                                                options: List<String>.from(
                                                    FFAppState()
                                                        .AccountList
                                                        .where((e) =>
                                                            e.active &&
                                                            (e.guid !=
                                                                _model
                                                                    .accDDValue))
                                                        .toList()
                                                        .map((e) => e.guid)
                                                        .toList()),
                                                optionLabels: FFAppState()
                                                    .AccountList
                                                    .where((e) =>
                                                        e.active &&
                                                        (e.guid !=
                                                            _model.accDDValue))
                                                    .toList()
                                                    .map((e) => e.name)
                                                    .toList(),
                                                onChanged: (val) =>
                                                    safeSetState(() => _model
                                                            .accTargetDDValue =
                                                        val),
                                                width: 300.0,
                                                height: 56.0,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText: 'โปรดเลือกบัญชี',
                                                icon: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                                fillColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                elevation: 1.0,
                                                borderColor:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                borderWidth: 1.0,
                                                borderRadius: 5.0,
                                                margin: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 4.0, 16.0, 4.0),
                                                hidesUnderline: true,
                                                isOverButton: true,
                                                isSearchable: false,
                                                isMultiSelect: false,
                                                labelText: '',
                                                labelTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'จำนวนเงิน',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: TextFormField(
                                                controller: _model
                                                    .amountTextFieldTextController,
                                                focusNode: _model
                                                    .amountTextFieldFocusNode,
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Prompt',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  hintText: 'โปรดระบุจำนวนเงิน',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Prompt',
                                                        letterSpacing: 0.0,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          letterSpacing: 0.0,
                                                        ),
                                                maxLength: 15,
                                                maxLengthEnforcement:
                                                    MaxLengthEnforcement
                                                        .enforced,
                                                buildCounter: (context,
                                                        {required currentLength,
                                                        required isFocused,
                                                        maxLength}) =>
                                                    null,
                                                keyboardType:
                                                    const TextInputType
                                                        .numberWithOptions(
                                                        decimal: true),
                                                validator: _model
                                                    .amountTextFieldTextControllerValidator
                                                    .asValidator(context),
                                                inputFormatters: [
                                                  FilteringTextInputFormatter
                                                      .allow(RegExp(
                                                          '^\\d+(\\.\\d{0,2})?\$'))
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'วัน เวลาที่ทำรายการ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Kanit',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                hintText:
                                                    'โปรดระบุวันที่ทำรายการ',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Prompt',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                              maxLength: 100,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              keyboardType:
                                                  TextInputType.datetime,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                final datePickedDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate:
                                                      getCurrentTimestamp,
                                                  firstDate: DateTime(1900),
                                                  lastDate: DateTime(2050),
                                                  builder: (context, child) {
                                                    return wrapInMaterialDatePickerTheme(
                                                      context,
                                                      child!,
                                                      headerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      headerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      headerTextStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineLarge
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 32.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                      pickerBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryBackground,
                                                      pickerForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      selectedDateTimeBackgroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      selectedDateTimeForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      actionButtonForegroundColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      iconSize: 24.0,
                                                    );
                                                  },
                                                );

                                                TimeOfDay? datePickedTime;
                                                if (datePickedDate != null) {
                                                  datePickedTime =
                                                      await showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.fromDateTime(
                                                            getCurrentTimestamp),
                                                    builder: (context, child) {
                                                      return wrapInMaterialTimePickerTheme(
                                                        context,
                                                        child!,
                                                        headerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        headerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        headerTextStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLarge
                                                                .override(
                                                                  fontFamily:
                                                                      'Kanit',
                                                                  fontSize:
                                                                      32.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                        pickerBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        pickerForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        selectedDateTimeBackgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        selectedDateTimeForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                        actionButtonForegroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        iconSize: 24.0,
                                                      );
                                                    },
                                                  );
                                                }

                                                if (datePickedDate != null &&
                                                    datePickedTime != null) {
                                                  safeSetState(() {
                                                    _model.datePicked =
                                                        DateTime(
                                                      datePickedDate.year,
                                                      datePickedDate.month,
                                                      datePickedDate.day,
                                                      datePickedTime!.hour,
                                                      datePickedTime.minute,
                                                    );
                                                  });
                                                }
                                                safeSetState(() {
                                                  _model.textController2?.text =
                                                      dateTimeFormat(
                                                    "d/M/y H:mm",
                                                    _model.datePicked,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  );
                                                });
                                              },
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 60.0,
                                                decoration: const BoxDecoration(
                                                  color: Color(0x00FFFFFF),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 60.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      if (_model.formKey.currentState == null ||
                                          !_model.formKey.currentState!
                                              .validate()) {
                                        return;
                                      }
                                      if (_model.accDDValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกบัญชีต้นทาง',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                        return;
                                      }
                                      if (_model.accTargetDDValue == null) {
                                        ScaffoldMessenger.of(context)
                                            .clearSnackBars();
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'กรุณาเลือกบัญชีปลายทาง',
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .error,
                                          ),
                                        );
                                        return;
                                      }
                                      _model.updateIndex =
                                          await actions.getIndexFromGuid(
                                        widget.transactionData!.guid,
                                        AppStateDataListType.Transaction,
                                      );
                                      FFAppState().updateTransactionsAtIndex(
                                        _model.updateIndex!,
                                        (e) => e
                                          ..accountId = _model.accDDValue
                                          ..targetAccountId =
                                              _model.accTargetDDValue
                                          ..amount = double.tryParse(_model
                                              .amountTextFieldTextController
                                              .text)
                                          ..date = functions.dateTimeFromString(
                                              _model.textController2.text)
                                          ..updateOnLocalTime =
                                              getCurrentTimestamp,
                                      );
                                      await Future.wait([
                                        Future(() async {
                                          _model.updateAccountIndex =
                                              await actions.getIndexFromGuid(
                                            widget.transactionData!.accountId,
                                            AppStateDataListType.Account,
                                          );
                                          _model.updateCurrBalance =
                                              await actions
                                                  .updateCurrentBalance(
                                            FFAppState()
                                                .AccountList[
                                                    _model.updateAccountIndex!]
                                                .guid,
                                          );
                                          FFAppState().updateAccountListAtIndex(
                                            _model.updateAccountIndex!,
                                            (e) => e
                                              ..currentAmount =
                                                  _model.updateCurrBalance,
                                          );
                                        }),
                                        Future(() async {
                                          _model.updateTargetAccountIndex =
                                              await actions.getIndexFromGuid(
                                            widget.transactionData!
                                                .targetAccountId,
                                            AppStateDataListType.Account,
                                          );
                                          _model.updateCurrTargetBalance =
                                              await actions
                                                  .updateCurrentBalance(
                                            FFAppState()
                                                .AccountList[_model
                                                    .updateTargetAccountIndex!]
                                                .guid,
                                          );
                                          FFAppState().updateAccountListAtIndex(
                                            _model.updateTargetAccountIndex!,
                                            (e) => e
                                              ..currentAmount = _model
                                                  .updateCurrTargetBalance,
                                          );
                                        }),
                                      ]);
                                      context.safePop();

                                      safeSetState(() {});
                                    },
                                    text: 'บันทึก',
                                    icon: const Icon(
                                      Icons.save,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 55.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Prompt',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FFButtonWidget(
                                    onPressed: () async {
                                      var shouldSetState = false;
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: const DeleteConfirmationWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.confirm = value));

                                      shouldSetState = true;
                                      if (_model.confirm!) {
                                        _model.deleteIndex =
                                            await actions.getIndexFromGuid(
                                          widget.transactionData!.guid,
                                          AppStateDataListType.Transaction,
                                        );
                                        shouldSetState = true;
                                        FFAppState()
                                            .removeAtIndexFromTransactions(
                                                _model.deleteIndex!);
                                        await Future.wait([
                                          Future(() async {
                                            _model.accountIndex =
                                                await actions.getIndexFromGuid(
                                              widget
                                                  .transactionData!.accountId,
                                              AppStateDataListType.Account,
                                            );
                                            shouldSetState = true;
                                            _model.currBalance = await actions
                                                .updateCurrentBalance(
                                              FFAppState()
                                                  .AccountList[
                                                      _model.accountIndex!]
                                                  .guid,
                                            );
                                            shouldSetState = true;
                                            FFAppState()
                                                .updateAccountListAtIndex(
                                              _model.accountIndex!,
                                              (e) => e
                                                ..currentAmount =
                                                    _model.currBalance,
                                            );
                                          }),
                                          Future(() async {
                                            _model.targetAccountIndex =
                                                await actions.getIndexFromGuid(
                                              widget.transactionData!
                                                  .targetAccountId,
                                              AppStateDataListType.Account,
                                            );
                                            shouldSetState = true;
                                            _model.currTargetBalance =
                                                await actions
                                                    .updateCurrentBalance(
                                              FFAppState()
                                                  .AccountList[_model
                                                      .targetAccountIndex!]
                                                  .guid,
                                            );
                                            shouldSetState = true;
                                            FFAppState()
                                                .updateAccountListAtIndex(
                                              _model.targetAccountIndex!,
                                              (e) => e
                                                ..currentAmount =
                                                    _model.currTargetBalance,
                                            );
                                          }),
                                        ]);
                                        context.safePop();
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      } else {
                                        if (shouldSetState) {
                                          safeSetState(() {});
                                        }
                                        return;
                                      }

                                      if (shouldSetState) safeSetState(() {});
                                    },
                                    text: 'ลบรายการ',
                                    icon: const Icon(
                                      Icons.delete_forever,
                                      size: 22.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 300.0,
                                      height: 55.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Prompt',
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
