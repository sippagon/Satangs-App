import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'retirement_personal_form_page_model.dart';
export 'retirement_personal_form_page_model.dart';

class RetirementPersonalFormPageWidget extends StatefulWidget {
  const RetirementPersonalFormPageWidget({super.key});

  @override
  State<RetirementPersonalFormPageWidget> createState() =>
      _RetirementPersonalFormPageWidgetState();
}

class _RetirementPersonalFormPageWidgetState
    extends State<RetirementPersonalFormPageWidget> {
  late RetirementPersonalFormPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RetirementPersonalFormPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().DateOfBirth != null) {
        safeSetState(() {
          _model.dateOfBirthFieldTextController?.text = dateTimeFormat(
            "d/M/y",
            FFAppState().DateOfBirth,
            locale: FFLocalizations.of(context).languageCode,
          );
        });
      }
    });

    _model.dateOfBirthFieldTextController ??= TextEditingController();
    _model.dateOfBirthFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                      'คำนวณเงินที่ต้องใช้หลังเกษียณ',
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Kanit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
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
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(26.0, 10.0, 26.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ข้อมูลทั่วไป',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Prompt',
                                    color: FlutterFlowTheme.of(context).primary,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            thickness: 3.0,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ข้อมูลการเงิน',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'Prompt',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            thickness: 3.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'ข้อมูลเงินออม',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Prompt',
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        SizedBox(
                          width: 100.0,
                          child: Divider(
                            thickness: 3.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(0.0),
                            topLeft: Radius.circular(25.0),
                            topRight: Radius.circular(25.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'ข้อมูลส่วนตัวของคุณ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Kanit',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 20.0, 0.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Form(
                                        key: _model.formKey,
                                        autovalidateMode:
                                            AutovalidateMode.disabled,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Stack(
                                                children: [
                                                  TextFormField(
                                                    controller: _model
                                                        .dateOfBirthFieldTextController,
                                                    focusNode: _model
                                                        .dateOfBirthFieldFocusNode,
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'วันเกิดของคุณ',
                                                      labelStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      hintText:
                                                          'โปรดระบุวันเกิดของคุณ....',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Prompt',
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 2.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                    maxLength: 100,
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
                                                        .dateOfBirthFieldTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      final datePickedDate =
                                                          await showDatePicker(
                                                        context: context,
                                                        initialDate:
                                                            getCurrentTimestamp,
                                                        firstDate:
                                                            DateTime(1900),
                                                        lastDate:
                                                            getCurrentTimestamp,
                                                        builder:
                                                            (context, child) {
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

                                                      if (datePickedDate !=
                                                          null) {
                                                        safeSetState(() {
                                                          _model.datePicked =
                                                              DateTime(
                                                            datePickedDate
                                                                .year,
                                                            datePickedDate
                                                                .month,
                                                            datePickedDate.day,
                                                          );
                                                        });
                                                      }
                                                      safeSetState(() {
                                                        _model.dateOfBirthFieldTextController
                                                                ?.text =
                                                            dateTimeFormat(
                                                          "d/M/y",
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        );
                                                      });
                                                      if (valueOrDefault<int>(
                                                            functions.getUserAge(
                                                                functions.dateFromString(
                                                                    _model
                                                                        .dateOfBirthFieldTextController
                                                                        .text)),
                                                            0,
                                                          ) >
                                                          80) {
                                                        await showDialog(
                                                          context: context,
                                                          builder:
                                                              (alertDialogContext) {
                                                            return AlertDialog(
                                                              title: const Text(
                                                                  'ขออภัยท่'),
                                                              content: const Text(
                                                                  'ท่านมีอายุมากเกินกว่าที่ระบบกำหนดไว้ (ไม่เกิน 80 ปี)'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: const Text(
                                                                      'รับทราบ'),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      } else {
                                                        safeSetState(() {
                                                          _model.retirementAgeSliderValue =
                                                              valueOrDefault<
                                                                  double>(
                                                            functions
                                                                .getUserAge(functions
                                                                    .dateFromString(_model
                                                                        .dateOfBirthFieldTextController
                                                                        .text))
                                                                .toDouble(),
                                                            0.0,
                                                          );
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 56.0,
                                                      decoration: const BoxDecoration(
                                                        color:
                                                            Color(0x00FFFFFF),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              const TextSpan(
                                                                text:
                                                                    'คุณจะเกษียณเมื่อถึงอายุ ',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  formatNumber(
                                                                    _model
                                                                        .retirementAgeSliderValue,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '#',
                                                                    locale: '',
                                                                  ),
                                                                  '0',
                                                                ),
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      22.0,
                                                                ),
                                                              ),
                                                              const TextSpan(
                                                                text: ' ปี',
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Prompt',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Slider(
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          inactiveColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          min: valueOrDefault<
                                                              double>(
                                                            () {
                                                              if (_model
                                                                      .datePicked !=
                                                                  null) {
                                                                return functions
                                                                    .getUserAge(
                                                                        _model
                                                                            .datePicked!);
                                                              } else if (FFAppState()
                                                                      .DateOfBirth !=
                                                                  null) {
                                                                return functions
                                                                    .getUserAge(
                                                                        FFAppState()
                                                                            .DateOfBirth!);
                                                              } else {
                                                                return 0;
                                                              }
                                                            }()
                                                                .toDouble(),
                                                            0.0,
                                                          ),
                                                          max: 80.0,
                                                          value: _model
                                                                  .retirementAgeSliderValue ??=
                                                              valueOrDefault<
                                                                          int>(
                                                                        () {
                                                                          if (_model.datePicked !=
                                                                              null) {
                                                                            return functions.getUserAge(_model.datePicked!);
                                                                          } else if (FFAppState().DateOfBirth !=
                                                                              null) {
                                                                            return functions.getUserAge(FFAppState().DateOfBirth!);
                                                                          } else {
                                                                            return 0;
                                                                          }
                                                                        }(),
                                                                        0,
                                                                      ) >
                                                                      60
                                                                  ? valueOrDefault<
                                                                      double>(
                                                                      () {
                                                                        if (_model.datePicked !=
                                                                            null) {
                                                                          return functions
                                                                              .getUserAge(_model.datePicked!);
                                                                        } else if (FFAppState().DateOfBirth !=
                                                                            null) {
                                                                          return functions
                                                                              .getUserAge(FFAppState().DateOfBirth!);
                                                                        } else {
                                                                          return 0;
                                                                        }
                                                                      }()
                                                                          .toDouble(),
                                                                      0.0,
                                                                    )
                                                                  : 60.0,
                                                          onChanged: (_model.dateOfBirthFieldTextController
                                                                          .text ==
                                                                      '')
                                                              ? null
                                                              : (newValue) {
                                                                  newValue = double
                                                                      .parse(newValue
                                                                          .toStringAsFixed(
                                                                              0));
                                                                  safeSetState(() =>
                                                                      _model.retirementAgeSliderValue =
                                                                          newValue);
                                                                },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              const TextSpan(
                                                                text:
                                                                    'คุณจะคิดว่าจะมีชีวิตอยู่จนถึงอายุ ',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  formatNumber(
                                                                    _model
                                                                        .lifeExpectedAgeSliderValue,
                                                                    formatType:
                                                                        FormatType
                                                                            .custom,
                                                                    format: '#',
                                                                    locale: '',
                                                                  ),
                                                                  '0',
                                                                ),
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize:
                                                                      22.0,
                                                                ),
                                                              ),
                                                              const TextSpan(
                                                                text: ' ปี',
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Prompt',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                        ),
                                                        Slider(
                                                          activeColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          inactiveColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .alternate,
                                                          min: valueOrDefault<
                                                              double>(
                                                            _model
                                                                .retirementAgeSliderValue,
                                                            0.0,
                                                          ),
                                                          max: 100.0,
                                                          value: _model
                                                                  .lifeExpectedAgeSliderValue ??=
                                                              85.0,
                                                          onChanged: (_model.dateOfBirthFieldTextController
                                                                          .text ==
                                                                      '')
                                                              ? null
                                                              : (newValue) {
                                                                  newValue = double
                                                                      .parse(newValue
                                                                          .toStringAsFixed(
                                                                              0));
                                                                  safeSetState(() =>
                                                                      _model.lifeExpectedAgeSliderValue =
                                                                          newValue);
                                                                },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ].divide(const SizedBox(height: 25.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    FFButtonWidget(
                                      onPressed: () async {
                                        if (_model.formKey.currentState ==
                                                null ||
                                            !_model.formKey.currentState!
                                                .validate()) {
                                          return;
                                        }
                                        FFAppState().TempRetirementFormInput =
                                            RetirementCalculationStruct(
                                          dateOfBirth: functions.dateFromString(
                                              _model
                                                  .dateOfBirthFieldTextController
                                                  .text),
                                          retirementAge:
                                              (_model.retirementAgeSliderValue!)
                                                  .round(),
                                          lifeExpectedAge: (_model
                                                  .lifeExpectedAgeSliderValue!)
                                              .round(),
                                        );

                                        context.pushNamed(
                                          'RetirementFinancialFormPage',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'ถัดไป',
                                      options: FFButtonOptions(
                                        width: 300.0,
                                        height: 50.0,
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'Prompt',
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ].divide(const SizedBox(height: 5.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
