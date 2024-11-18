import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_checkbox_group.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'taxes_personal_info_form_page_model.dart';
export 'taxes_personal_info_form_page_model.dart';

class TaxesPersonalInfoFormPageWidget extends StatefulWidget {
  const TaxesPersonalInfoFormPageWidget({
    super.key,
    required this.guid,
  });

  final String? guid;

  @override
  State<TaxesPersonalInfoFormPageWidget> createState() =>
      _TaxesPersonalInfoFormPageWidgetState();
}

class _TaxesPersonalInfoFormPageWidgetState
    extends State<TaxesPersonalInfoFormPageWidget> {
  late TaxesPersonalInfoFormPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaxesPersonalInfoFormPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.updateIndex = await actions.getIndexFromGuid(
        widget.guid!,
        AppStateDataListType.Taxes,
      );
      _model.viewModel = FFAppState().Taxes[_model.updateIndex!];
      safeSetState(() {});
      safeSetState(() {
        _model.maritalStatusRadioButtonValueController?.value = () {
          if (_model.viewModel?.personalInformation.maritalStatus ==
              MaritalStatus.Married) {
            return 'สมรส';
          } else if (_model.viewModel?.personalInformation.maritalStatus ==
              MaritalStatus.Widowed) {
            return 'หม้าย';
          } else if (_model.viewModel?.personalInformation.maritalStatus ==
              MaritalStatus.Divorced) {
            return 'หย่าร้าง';
          } else {
            return 'โสด';
          }
        }();
      });
      safeSetState(() {
        _model.parentsCheckboxGroupValueController?.value =
            _model.viewModel!.personalInformation.parentsChecked;
      });
      safeSetState(() {
        _model.childSliderValue = valueOrDefault<double>(
          _model.viewModel?.personalInformation.numberOfChild.toDouble(),
          0.0,
        );
      });
      safeSetState(() {
        _model.disablePeopleRadioButtonValueController?.value =
            valueOrDefault<String>(
          _model.viewModel!.personalInformation.numberOfDisablePeople > 0
              ? 'ใช่'
              : 'ไม่',
          'ไม่',
        );
      });
      safeSetState(() {
        _model.disablePeopleSliderValue = valueOrDefault<double>(
          _model.viewModel?.personalInformation.numberOfDisablePeople
              .toDouble(),
          0.0,
        );
      });
    });

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
                      'ข้อมูลส่วนตัวและครอบครัว',
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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
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
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'สถานะสมรส',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                        FlutterFlowRadioButton(
                                          options: [
                                            'โสด',
                                            'สมรส',
                                            'หม้าย',
                                            'หย่าร้าง'
                                          ].toList(),
                                          onChanged: (val) =>
                                              safeSetState(() {}),
                                          controller: _model
                                                  .maritalStatusRadioButtonValueController ??=
                                              FormFieldController<String>(
                                                  'โสด'),
                                          optionHeight: 32.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Prompt',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          textPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 12.0, 0.0),
                                          buttonPosition:
                                              RadioButtonPosition.left,
                                          direction: Axis.horizontal,
                                          radioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          inactiveRadioButtonColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          toggleable: false,
                                          horizontalAlignment:
                                              WrapAlignment.start,
                                          verticalAlignment:
                                              WrapCrossAlignment.start,
                                        ),
                                      ].divide(const SizedBox(height: 5.0)),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'ลดหย่อนบิดาและมารดา',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: FlutterFlowCheckboxGroup(
                                                  options: const ['บิดา', 'มารดา'],
                                                  onChanged: (val) =>
                                                      safeSetState(() => _model
                                                              .parentsCheckboxGroupValues =
                                                          val),
                                                  controller: _model
                                                          .parentsCheckboxGroupValueController ??=
                                                      FormFieldController<
                                                          List<String>>(
                                                    [],
                                                  ),
                                                  activeColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  checkColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  checkboxBorderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryText,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Prompt',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                  checkboxBorderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  initialized: _model
                                                          .parentsCheckboxGroupValues !=
                                                      null,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'จำนวนบุตร',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          Slider(
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            min: 0.0,
                                            max: 3.0,
                                            value: _model.childSliderValue ??=
                                                0.0,
                                            divisions: 3,
                                            onChanged: (newValue) {
                                              newValue = double.parse(
                                                  newValue.toStringAsFixed(0));
                                              safeSetState(() => _model
                                                  .childSliderValue = newValue);
                                            },
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'มีผู้พิการทุพพลภาพอยู่ในการดูแลหรือไม่?',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                          FlutterFlowRadioButton(
                                            options: ['ใช่', 'ไม่'].toList(),
                                            onChanged: (val) =>
                                                safeSetState(() {}),
                                            controller: _model
                                                    .disablePeopleRadioButtonValueController ??=
                                                FormFieldController<String>(
                                                    'ไม่'),
                                            optionHeight: 32.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .override(
                                                      fontFamily: 'Prompt',
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                    ),
                                            textPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 15.0, 0.0),
                                            buttonPosition:
                                                RadioButtonPosition.left,
                                            direction: Axis.horizontal,
                                            radioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            inactiveRadioButtonColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            toggleable: false,
                                            horizontalAlignment:
                                                WrapAlignment.start,
                                            verticalAlignment:
                                                WrapCrossAlignment.start,
                                          ),
                                        ].divide(const SizedBox(height: 5.0)),
                                      ),
                                    ),
                                  ],
                                ),
                                if (_model.disablePeopleRadioButtonValue ==
                                    'ใช่')
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'จำนวนผู้พิการทุพพลภาพ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Kanit',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                            Slider(
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              min: 0.0,
                                              max: 3.0,
                                              value: _model
                                                      .disablePeopleSliderValue ??=
                                                  0.0,
                                              label: _model
                                                  .disablePeopleSliderValue
                                                  ?.toStringAsFixed(0),
                                              divisions: 3,
                                              onChanged: (newValue) {
                                                newValue = double.parse(newValue
                                                    .toStringAsFixed(0));
                                                safeSetState(() => _model
                                                        .disablePeopleSliderValue =
                                                    newValue);
                                              },
                                            ),
                                          ].divide(const SizedBox(height: 5.0)),
                                        ),
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 40.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().updateTaxesAtIndex(
                                            _model.updateIndex!,
                                            (e) => e
                                              ..updatePersonalInformation(
                                                (e) => e
                                                  ..maritalStatus = () {
                                                    if ((_model.maritalStatusRadioButtonValue ==
                                                            'โสด') ||
                                                        (_model.maritalStatusRadioButtonValue ==
                                                            MaritalStatus
                                                                .Single.name)) {
                                                      return MaritalStatus
                                                          .Single;
                                                    } else if ((_model
                                                                .maritalStatusRadioButtonValue ==
                                                            'สมรส') ||
                                                        (_model.maritalStatusRadioButtonValue ==
                                                            MaritalStatus
                                                                .Married
                                                                .name)) {
                                                      return MaritalStatus
                                                          .Married;
                                                    } else {
                                                      return MaritalStatus
                                                          .Single;
                                                    }
                                                  }()
                                                  ..numberOfChild =
                                                      valueOrDefault<int>(
                                                    valueOrDefault<double>(
                                                      _model.childSliderValue,
                                                      0.0,
                                                    ).round(),
                                                    0,
                                                  )
                                                  ..numberOfParent = _model
                                                      .parentsCheckboxGroupValues
                                                      ?.length
                                                  ..numberOfDisablePeople =
                                                      _model.disablePeopleRadioButtonValue ==
                                                              'ใช่'
                                                          ? valueOrDefault<int>(
                                                              valueOrDefault<
                                                                  double>(
                                                                _model
                                                                    .disablePeopleSliderValue,
                                                                0.0,
                                                              ).round(),
                                                              0,
                                                            )
                                                          : 0
                                                  ..parentsChecked = _model
                                                      .parentsCheckboxGroupValues!
                                                      .toList(),
                                              ),
                                          );
                                          await actions.calculateTaxToBePaid(
                                            widget.guid!,
                                          );
                                          context.safePop();
                                        },
                                        text: 'บันทึก',
                                        icon: const Icon(
                                          Icons.save,
                                          size: 15.0,
                                        ),
                                        options: FFButtonOptions(
                                          width: 300.0,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
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
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ].divide(const SizedBox(height: 25.0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
