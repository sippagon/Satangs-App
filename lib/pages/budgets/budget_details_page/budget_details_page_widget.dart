import '/backend/schema/enums/enums.dart';
import '/componants/delete_confirmation/delete_confirmation_widget.dart';
import '/componants/edit_or_delete_goal/edit_or_delete_goal_widget.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/budget_detail_page.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'budget_details_page_model.dart';
export 'budget_details_page_model.dart';

class BudgetDetailsPageWidget extends StatefulWidget {
  const BudgetDetailsPageWidget({
    super.key,
    required this.budgetGuid,
  });

  final String? budgetGuid;

  @override
  State<BudgetDetailsPageWidget> createState() =>
      _BudgetDetailsPageWidgetState();
}

class _BudgetDetailsPageWidgetState extends State<BudgetDetailsPageWidget> {
  late BudgetDetailsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BudgetDetailsPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.oneMonthDateRange = await actions.getFilterDateRangeValue(
        DateFilterRange.oneMonth,
      );
      _model.viewModel = await actions.mapBudgetDetailsViewModel(
        widget.budgetGuid!,
      );
      if (_model.viewModel == null) {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text('พบข้อผิดพลาด'),
              content: const Text(
                  'ไม่พบข้อมูลแผนการใช้จ่ายที่คุณเลือก โปรดลองใหม่ในภายหลัง'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text('กลับหน้าหลัก'),
                ),
              ],
            );
          },
        );
        context.safePop();
      } else {
        _model.budgetDetailsViewModel = _model.viewModel;
        safeSetState(() {});
      }

      if (FFAppState().initialBudgetDetailPageWT) {
        safeSetState(() =>
            _model.budgetDetailPageController = createPageWalkthrough(context));
        _model.budgetDetailPageController?.show(context: context);
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
                                                _model.updateIndex =
                                                    await actions
                                                        .getIndexFromGuid(
                                                  widget.budgetGuid!,
                                                  AppStateDataListType.Budget,
                                                );
                                                FFAppState()
                                                        .TempBudgetFormInput =
                                                    FFAppState().Budgets[
                                                        _model.updateIndex!];
                                                safeSetState(() {});

                                                context.pushNamed(
                                                    'EditBudgetPage');
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
                                                  _model.deleteIndex =
                                                      await actions
                                                          .getIndexFromGuid(
                                                    widget.budgetGuid!,
                                                    AppStateDataListType.Budget,
                                                  );
                                                  shouldSetState = true;
                                                  FFAppState()
                                                      .removeAtIndexFromBudgets(
                                                          _model.deleteIndex!);
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
                                  iconButton7ua2kgil,
                                  _model.budgetDetailPageController,
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
                        _model.viewModel?.name,
                        'BudgetName',
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
                      textR3ykg455,
                      _model.budgetDetailPageController,
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
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (false)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0x37F9CF58),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .warning_amber_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 58.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              child: Text(
                                                                'คุณได้ใช้จ่ายเกินงบประมาณที่คุณได้กำหนดเอาไว้แล้วสำหรับเดือนนี้!',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Prompt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(const SizedBox(width: 10.0)),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'งบประมาณทั้งหมด',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Prompt',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      RichText(
                                        textScaler:
                                            MediaQuery.of(context).textScaler,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: dateTimeFormat(
                                                "d/M/y",
                                                _model.oneMonthDateRange!.first,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              style: const TextStyle(),
                                            ),
                                            const TextSpan(
                                              text: ' - ',
                                              style: TextStyle(),
                                            ),
                                            TextSpan(
                                              text: dateTimeFormat(
                                                "d/M/y",
                                                _model.oneMonthDateRange!.last,
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
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  valueOrDefault<String>(
                                    formatNumber(
                                      _model
                                          .budgetDetailsViewModel?.totalBudget,
                                      formatType: FormatType.decimal,
                                      decimalType: DecimalType.periodDecimal,
                                    ),
                                    '0.0',
                                  ).maybeHandleOverflow(
                                    maxChars: 12,
                                    replacement: '…',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Kanit',
                                        fontSize: 22.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'บาท',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Prompt',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ใช้ไปแล้ว',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Prompt',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              _model.budgetDetailsViewModel
                                                  ?.totalUsage,
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            '0.0',
                                          ).maybeHandleOverflow(
                                            maxChars: 7,
                                            replacement: '…',
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          'คงเหลือ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Prompt',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            formatNumber(
                                              valueOrDefault<double>(
                                                    _model
                                                        .budgetDetailsViewModel
                                                        ?.totalBudget,
                                                    0.0,
                                                  ) -
                                                  valueOrDefault<double>(
                                                    _model
                                                        .budgetDetailsViewModel
                                                        ?.totalUsage,
                                                    0.0,
                                                  ),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            '0.0',
                                          ).maybeHandleOverflow(
                                            maxChars: 7,
                                            replacement: '…',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 20.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: LinearPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        _model.viewModel?.totalUsagePercentage,
                                        0.0,
                                      ),
                                      lineHeight: 34.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor: valueOrDefault<Color>(
                                        () {
                                          if (valueOrDefault<double>(
                                                _model.viewModel
                                                    ?.totalUsagePercentage,
                                                0.0,
                                              ) >=
                                              0.8) {
                                            return FlutterFlowTheme.of(context)
                                                .error;
                                          } else if (valueOrDefault<double>(
                                                _model.viewModel
                                                    ?.totalUsagePercentage,
                                                0.0,
                                              ) >=
                                              0.6) {
                                            return FlutterFlowTheme.of(context)
                                                .tertiary;
                                          } else if (valueOrDefault<double>(
                                                _model.viewModel
                                                    ?.totalUsagePercentage,
                                                0.0,
                                              ) >=
                                              0.4) {
                                            return FlutterFlowTheme.of(context)
                                                .warning;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .success;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      center: Text(
                                        valueOrDefault<String>(
                                          formatNumber(
                                            _model.viewModel
                                                ?.totalUsagePercentage,
                                            formatType: FormatType.percent,
                                          ),
                                          '0.0',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Kanit',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                      barRadius: const Radius.circular(25.0),
                                      padding: EdgeInsets.zero,
                                    ).addWalkthrough(
                                      progressBar1q7x007i,
                                      _model.budgetDetailPageController,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Builder(
                                builder: (context) {
                                  final items = _model.budgetDetailsViewModel
                                          ?.categoriesList
                                          .toList() ??
                                      [];
                                  if (items.isEmpty) {
                                    return const EmptyListItemsWidget(
                                      title: 'ไม่พบข้อมูล',
                                      description:
                                          'ไม่พบรายการที่จะแสดง อาจเกิดข้อพิดพลาด โปรดลองใหม่ภายหลัง',
                                    );
                                  }

                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: items.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 15.0),
                                    itemBuilder: (context, itemsIndex) {
                                      final itemsItem = items[itemsIndex];
                                      return Container(
                                        width: 100.0,
                                        height: 80.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        itemsItem.name
                                                            .maybeHandleOverflow(
                                                          maxChars: 20,
                                                          replacement: '…',
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Prompt',
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (itemsItem
                                                                    .budget >
                                                                0.0) {
                                                              return RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text:
                                                                          formatNumber(
                                                                        itemsItem
                                                                            .usageAmount,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.periodDecimal,
                                                                      ),
                                                                      style:
                                                                          TextStyle(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .error,
                                                                      ),
                                                                    ),
                                                                    const TextSpan(
                                                                      text:
                                                                          ' / ',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          formatNumber(
                                                                        itemsItem
                                                                            .budget,
                                                                        formatType:
                                                                            FormatType.decimal,
                                                                        decimalType:
                                                                            DecimalType.periodDecimal,
                                                                      ),
                                                                      style:
                                                                          const TextStyle(),
                                                                    )
                                                                  ],
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Prompt',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                              );
                                                            } else {
                                                              return Text(
                                                                formatNumber(
                                                                  itemsItem
                                                                      .usageAmount,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                ).maybeHandleOverflow(
                                                                  maxChars: 7,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Prompt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ).addWalkthrough(
                                        container5zzdiu59,
                                        _model.budgetDetailPageController,
                                        listIndex: itemsIndex,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.budgetDetailPageController = null);
          FFAppState().initialBudgetDetailPageWT = false;
        },
        onSkip: () {
          () async {
            FFAppState().initialBudgetDetailPageWT = false;
          }();
          return true;
        },
      );
}
