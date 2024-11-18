import '/backend/schema/structs/index.dart';
import '/componants/delete_confirmation/delete_confirmation_widget.dart';
import '/componants/edit_or_delete_goal/edit_or_delete_goal_widget.dart';
import '/componants/goal_add_amount/goal_add_amount_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/walkthroughs/goal_detail_page.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'goal_details_page_model.dart';
export 'goal_details_page_model.dart';

class GoalDetailsPageWidget extends StatefulWidget {
  const GoalDetailsPageWidget({
    super.key,
    required this.goalGuid,
    required this.goalIndex,
  });

  final String? goalGuid;
  final int? goalIndex;

  @override
  State<GoalDetailsPageWidget> createState() => _GoalDetailsPageWidgetState();
}

class _GoalDetailsPageWidgetState extends State<GoalDetailsPageWidget> {
  late GoalDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.goalData = FFAppState()
          .Goals
          .where((e) => e.guid == widget.goalGuid)
          .toList()
          .first;
      safeSetState(() {});
      _model.initalSavingDataTable = await actions.calculateGoalSavingDatatable(
        widget.goalGuid!,
      );
      _model.savingTableData = _model.initalSavingDataTable!
          .toList()
          .cast<GoalMonthSavingDataTableStruct>();
      safeSetState(() {});
      if ((_model.initalSavingDataTable != null &&
              (_model.initalSavingDataTable)!.isNotEmpty) &&
          !(_model.initalSavingDataTable!
              .where((e) => e.reachTargetOnThisMonth)
              .toList()
              .isNotEmpty)) {
        _model.requireInterestResult =
            await actions.calculateGoalRequiredInterestRate(
          valueOrDefault<double>(
            _model.goalData?.targetAmount,
            0.0,
          ),
          valueOrDefault<double>(
            _model.goalData?.currentBalance,
            0.0,
          ),
          valueOrDefault<double>(
            _model.initalSavingDataTable
                ?.where((e) => e.savings > 0.0)
                .toList()
                .sortedList(keyOf: (e) => e.savings, desc: false)
                .first
                .savings,
            0.0,
          ),
          valueOrDefault<int>(
            _model.initalSavingDataTable?.length,
            0,
          ),
        );
        _model.requireInterestResults =
            _model.requireInterestResult!.toList().cast<double>();
        safeSetState(() {});
      } else {
        _model.possibleSuccess = true;
        safeSetState(() {});
      }

      if (FFAppState().initialGoalDetailPageWT) {
        safeSetState(() =>
            _model.goalDetailPageController = createPageWalkthrough(context));
        _model.goalDetailPageController?.show(context: context);
      }
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
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.goNamed('GoalAndBudgetPage');
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        Align(
                          alignment: const AlignmentDirectional(1.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: FlutterFlowIconButton(
                                  borderColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  icon: Icon(
                                    Icons.edit_sharp,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: EditOrDeleteGoalWidget(
                                              updateAction: () async {
                                                FFAppState().TempGoalFormInput =
                                                    FFAppState().Goals[
                                                        widget.goalIndex!];
                                                safeSetState(() {});
                                                context.pushNamed(
                                                  'EditGoalPage',
                                                  queryParameters: {
                                                    'goalUpdateIndex':
                                                        serializeParam(
                                                      widget.goalIndex,
                                                      ParamType.int,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    kTransitionInfoKey:
                                                        const TransitionInfo(
                                                      hasTransition: true,
                                                      transitionType:
                                                          PageTransitionType
                                                              .leftToRight,
                                                    ),
                                                  },
                                                );
                                                                                            },
                                              deleteAction: () async {
                                                var shouldSetState = false;
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () =>
                                                          FocusScope.of(context)
                                                              .unfocus(),
                                                      child: Padding(
                                                        padding: MediaQuery
                                                            .viewInsetsOf(
                                                                context),
                                                        child:
                                                            const DeleteConfirmationWidget(),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) => safeSetState(
                                                    () => _model.confirmResult =
                                                        value));

                                                shouldSetState = true;
                                                if (_model.confirmResult!) {
                                                  FFAppState()
                                                      .removeAtIndexFromGoals(
                                                          widget.goalIndex!);
                                                  safeSetState(() {});

                                                  context.goNamed(
                                                      'GoalAndBudgetPage');

                                                  return;
                                                } else {
                                                  return;
                                                }
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    safeSetState(() {});
                                  },
                                ).addWalkthrough(
                                  iconButtonTfvxx0fx,
                                  _model.goalDetailPageController,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        _model.goalData?.name,
                        'เป้าหมาย',
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Kanit',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w500,
                              ),
                    ).addWalkthrough(
                      text4dj6nqbw,
                      _model.goalDetailPageController,
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
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              25.0, 25.0, 25.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'เหลืออีก ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: valueOrDefault<String>(
                                              formatNumber(
                                                functions
                                                    .calculateDaysDiffFromPresent(
                                                        _model.goalData!
                                                            .targetDate!),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                              ),
                                              '0',
                                            ),
                                            style: const TextStyle(),
                                          ),
                                          const TextSpan(
                                            text: ' วัน',
                                            style: TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Kanit',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ).addWalkthrough(
                                      richText31b5ngnp,
                                      _model.goalDetailPageController,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'จะถึงวันที่ ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: dateTimeFormat(
                                              "d/M/y",
                                              _model.goalData!.targetDate!,
                                              locale:
                                                  FFLocalizations.of(context)
                                                      .languageCode,
                                            ),
                                            style: const TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Prompt',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularPercentIndicator(
                                        percent:
                                            _model.goalData!.progressPercatage,
                                        radius: 95.0,
                                        lineWidth: 18.0,
                                        animation: true,
                                        animateFromLastPercent: true,
                                        progressColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        center: Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              _model
                                                  .goalData?.progressPercatage,
                                              formatType: FormatType.percent,
                                            ),
                                            '0.0',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Kanit',
                                                fontSize: 32.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ).addWalkthrough(
                                    rowYlbezk7e,
                                    _model.goalDetailPageController,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'คุณเก็บเงินไปแล้วทั้งสิน',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Prompt',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: formatNumber(
                                              _model.goalData!.currentBalance,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Kanit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' / ',
                                            style: TextStyle(),
                                          ),
                                          TextSpan(
                                            text: formatNumber(
                                              _model.goalData!.targetAmount,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            style: const TextStyle(),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Prompt',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 22.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ).addWalkthrough(
                                      richTextQg6bvdsw,
                                      _model.goalDetailPageController,
                                    ),
                                  ],
                                ),
                                if (!_model.goalData!.isFinished)
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'คุณจะต้องเก็บเงิน',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Prompt',
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (!_model.goalData!.isFinished)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: formatNumber(
                                                functions
                                                    .calculateSavingAmountPerMonthForGoal(
                                                        valueOrDefault<double>(
                                                          _model.goalData
                                                              ?.currentBalance,
                                                          0.0,
                                                        ),
                                                        _model.goalData!
                                                            .targetDate!,
                                                        valueOrDefault<double>(
                                                          _model.goalData
                                                              ?.savingInterestRate,
                                                          0.0,
                                                        ),
                                                        valueOrDefault<double>(
                                                          _model.goalData
                                                              ?.targetAmount,
                                                          0.0,
                                                        )),
                                                formatType: FormatType.decimal,
                                                decimalType:
                                                    DecimalType.periodDecimal,
                                              ),
                                              style: const TextStyle(),
                                            )
                                          ],
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                if (!_model.goalData!.isFinished)
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ต่อเดือนเพื่อบรรลุเป้าหมาย',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Prompt',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                if (!_model.goalData!.isFinished &&
                                    (_model.requireInterestResults.isNotEmpty))
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'หรือฝากเดือนละ ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  formatNumber(
                                                    _model
                                                        .requireInterestResults
                                                        .first,
                                                    formatType:
                                                        FormatType.decimal,
                                                    decimalType: DecimalType
                                                        .periodDecimal,
                                                  ),
                                                  '0',
                                                ),
                                                style: const TextStyle(),
                                              ),
                                              const TextSpan(
                                                text:
                                                    ' บาท และลงทุนในสินทรัพย์ที่ให้ผลตอบแทนเดือนละ ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  formatNumber(
                                                    _model
                                                        .requireInterestResults
                                                        .last,
                                                    formatType:
                                                        FormatType.custom,
                                                    format: '#.##',
                                                    locale: '',
                                                  ),
                                                  '0',
                                                ),
                                                style: const TextStyle(),
                                              ),
                                              const TextSpan(
                                                text: '%',
                                                style: TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Prompt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Builder(
                                          builder: (context) {
                                            if (!_model.goalData!.isFinished) {
                                              return Builder(
                                                builder: (context) {
                                                  if (_model.savingTableData
                                                      .isNotEmpty) {
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'GoalSavingDataTablePage',
                                                          queryParameters: {
                                                            'dataTable':
                                                                serializeParam(
                                                              _model
                                                                  .savingTableData,
                                                              ParamType
                                                                  .DataStruct,
                                                              isList: true,
                                                            ),
                                                            'targetAmount':
                                                                serializeParam(
                                                              _model.goalData
                                                                  ?.targetAmount,
                                                              ParamType.double,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 150.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .alternate,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              _model.savingTableData.where((e) => e.reachTargetOnThisMonth).toList().isNotEmpty ? 'มีโอกาศสำเร็จตามเป้า!' : 'อาจจะไม่ถึงเป้า',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Kanit',
                                                                                    color: valueOrDefault<Color>(
                                                                                      !_model.possibleSuccess ? FlutterFlowTheme.of(context).error : FlutterFlowTheme.of(context).secondary,
                                                                                      FlutterFlowTheme.of(context).primary,
                                                                                    ),
                                                                                    fontSize: 28.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                            Align(
                                                                              alignment: const AlignmentDirectional(1.0, 0.0),
                                                                              child: Icon(
                                                                                Icons.chevron_right,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: RichText(
                                                                                textScaler: MediaQuery.of(context).textScaler,
                                                                                text: TextSpan(
                                                                                  children: [
                                                                                    TextSpan(
                                                                                      text: () {
                                                                                        if (_model.savingTableData.where((e) => e.reachTargetOnThisMonth).toList().isNotEmpty) {
                                                                                          return 'จากการวิเคราห์และประเมิน พบว่าคุณจะสามารถสะสมเงินได้ ';
                                                                                        } else if (_model.savingTableData.last.balance < 0.0) {
                                                                                          return 'จากการประเมินพบว่า คุณจะมียอดการใช้จ่ายเกินและติดลบที่ ';
                                                                                        } else {
                                                                                          return 'จากการวิเคราะห๋และประเมิน พบว่าคุณจะสามารถสะสมเงินได้เพียง ';
                                                                                        }
                                                                                      }(),
                                                                                      style: const TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: valueOrDefault<String>(
                                                                                        formatNumber(
                                                                                          _model.savingTableData.sortedList(keyOf: (e) => e.month, desc: true).first.balance,
                                                                                          formatType: FormatType.decimal,
                                                                                          decimalType: DecimalType.periodDecimal,
                                                                                        ),
                                                                                        '0.0',
                                                                                      ),
                                                                                      style: const TextStyle(),
                                                                                    ),
                                                                                    TextSpan(
                                                                                      text: () {
                                                                                        if (_model.savingTableData.where((e) => e.reachTargetOnThisMonth).toList().isNotEmpty) {
                                                                                          return (_model.savingTableData.where((e) => e.reachTargetOnThisMonth).toList().first.balance > _model.goalData!.targetAmount ? ' มากกว่าเป้าหมายที่ได้กำหนดไว้' : 'ตามเป้าหมายที่ได้กำหนดไว้');
                                                                                        } else if (_model.savingTableData.last.balance < 0.0) {
                                                                                          return ' บาท';
                                                                                        } else {
                                                                                          return ' บาท เท่านั้น';
                                                                                        }
                                                                                      }(),
                                                                                      style: const TextStyle(),
                                                                                    )
                                                                                  ],
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Prompt',
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        letterSpacing: 0.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Text(
                                                                                'หมายเหตุ: การประเมินโอกาศสำเร็จ ระบบได้กำหนดอัตราเงินเฟ้อไว้ที่ 3% ต่อปี',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Prompt',
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ].divide(const SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ).addWalkthrough(
                                                      containerMjl0jeoh,
                                                      _model
                                                          .goalDetailPageController,
                                                    );
                                                  } else {
                                                    return Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: 150.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .alternate,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(
                                                            10.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Expanded(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'ไม่สามารถประเมินได้',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: 'Kanit',
                                                                                  color: const Color(0xFFFF540C),
                                                                                  fontSize: 28.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              'เนื่องจากระยะเวลานับจากวันนี้ถึงวันที่ครบกำหนดของเป้าหมายนั้นน้อยกว่า 1 เดือน',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Prompt',
                                                                                    letterSpacing: 0.0,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(const SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                ),
                                                              ].divide(const SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                              );
                                            } else {
                                              return Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height: 200.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Lottie
                                                                        .network(
                                                                      'https://lottie.host/0e32921f-69de-4c43-ba63-ad936bc9336b/0bxuO6mcnm.json',
                                                                      width:
                                                                          120.0,
                                                                      height:
                                                                          100.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                      repeat:
                                                                          false,
                                                                      animate:
                                                                          true,
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      'ยินดีด้วย!\nคุณทำสำเร็จแล้ว',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Kanit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            fontSize:
                                                                                24.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ].divide(const SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                          },
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
                      if (!_model.goalData!.isFinished)
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    enableDrag: false,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () =>
                                            FocusScope.of(context).unfocus(),
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: GoalAddAmountWidget(
                                            goalUpdateIndex: widget.goalIndex!,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(
                                      () => _model.submited = value));

                                  if (_model.submited!) {
                                    _model.adjustSavingDatatable = await actions
                                        .calculateGoalSavingDatatable(
                                      widget.goalGuid!,
                                    );
                                    _model.savingTableData = _model
                                        .adjustSavingDatatable!
                                        .toList()
                                        .cast<GoalMonthSavingDataTableStruct>();
                                    if (_model.adjustSavingDatatable!
                                        .where((e) => e.reachTargetOnThisMonth)
                                        .toList()
                                        .isNotEmpty) {
                                      _model.requireInterestResults = [];
                                      _model.possibleSuccess = true;
                                    } else {
                                      _model.adjustRequireInterestResult =
                                          await actions
                                              .calculateGoalRequiredInterestRate(
                                        valueOrDefault<double>(
                                          _model.goalData?.targetAmount,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.goalData?.currentBalance,
                                          0.0,
                                        ),
                                        valueOrDefault<double>(
                                          _model.adjustSavingDatatable
                                              ?.where((e) => e.savings > 0.0)
                                              .toList()
                                              .sortedList(
                                                  keyOf: (e) => e.savings,
                                                  desc: false)
                                              .first
                                              .savings,
                                          0.0,
                                        ),
                                        valueOrDefault<int>(
                                          _model.adjustSavingDatatable?.length,
                                          0,
                                        ),
                                      );
                                      _model.possibleSuccess = false;
                                      _model.requireInterestResults = _model
                                          .adjustRequireInterestResult!
                                          .toList()
                                          .cast<double>();
                                    }
                                  }

                                  safeSetState(() {});
                                },
                                text: 'เพิ่มเงินออม',
                                options: FFButtonOptions(
                                  width: 300.0,
                                  height: 50.0,
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
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
                              ).addWalkthrough(
                                buttonOycebq09,
                                _model.goalDetailPageController,
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.goalDetailPageController = null);
          FFAppState().initialGoalDetailPageWT = false;
        },
        onSkip: () {
          () async {
            FFAppState().initialGoalDetailPageWT = false;
          }();
          return true;
        },
      );
}
