import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/report_page.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'statistic_page_model.dart';
export 'statistic_page_model.dart';

class StatisticPageWidget extends StatefulWidget {
  const StatisticPageWidget({super.key});

  @override
  State<StatisticPageWidget> createState() => _StatisticPageWidgetState();
}

class _StatisticPageWidgetState extends State<StatisticPageWidget>
    with TickerProviderStateMixin {
  late StatisticPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatisticPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initDateRangeResult = await actions.getFilterDateRangeValue(
        DateFilterRange.oneMonth,
      );
      _model.filterTransactions = FFAppState()
          .Transactions
          .where((e) =>
              (e.date! >= _model.initDateRangeResult!.first) &&
              (e.date! <= _model.initDateRangeResult!.last))
          .toList()
          .toList()
          .cast<TransactionStruct>();
      _model.dateRangeFilter =
          _model.initDateRangeResult!.toList().cast<DateTime>();
      safeSetState(() {});
      _model.initIncomePieChartData =
          await actions.mapTransactionToPieChartData(
        _model.filterTransactions
            .where((e) => e.typeId == TransactionType.Income.name)
            .toList()
            .toList(),
        TransactionType.Income,
      );
      _model.initExpensePieChartData =
          await actions.mapTransactionToPieChartData(
        _model.filterTransactions
            .where((e) => e.typeId == TransactionType.Expense.name)
            .toList()
            .toList(),
        TransactionType.Expense,
      );
      _model.incomePieChartData =
          _model.initIncomePieChartData!.toList().cast<DonutChartDataStruct>();
      _model.expensePieChartData =
          _model.initExpensePieChartData!.toList().cast<DonutChartDataStruct>();
      safeSetState(() {});
      if (FFAppState().initialReportWT) {
        safeSetState(
            () => _model.reportPageController = createPageWalkthrough(context));
        _model.reportPageController?.show(context: context);
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'สรุปรายรับรายจ่าย',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: FlutterFlowChoiceChips(
                            options: const [
                              ChipData('เดือนนี้'),
                              ChipData('3 เดือนล่าสุด'),
                              ChipData('ปีนี้'),
                              ChipData('เลือกเอง')
                            ],
                            onChanged: (val) async {
                              safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull);
                              if (_model.choiceChipsValue == 'เลือกเอง') {
                                _model.customDateRangeResult =
                                    await actions.showCustomDateRange(
                                  context,
                                );
                                _model.dateRangeFilter = _model
                                    .customDateRangeResult!
                                    .toList()
                                    .cast<DateTime>();
                                safeSetState(() {});
                              } else {
                                _model.selectedDateRangeResult =
                                    await actions.getFilterDateRangeValue(
                                  () {
                                    if (_model.choiceChipsValue == 'เดือนนี้') {
                                      return DateFilterRange.oneMonth;
                                    } else if (_model.choiceChipsValue ==
                                        '3 เดือนล่าสุด') {
                                      return DateFilterRange.threeMonth;
                                    } else {
                                      return DateFilterRange.thisYear;
                                    }
                                  }(),
                                );
                                _model.dateRangeFilter = _model
                                    .selectedDateRangeResult!
                                    .toList()
                                    .cast<DateTime>();
                                safeSetState(() {});
                              }

                              _model.filterTransactions = FFAppState()
                                  .Transactions
                                  .where((e) =>
                                      (e.date! >=
                                          _model.dateRangeFilter.first) &&
                                      (e.date! <= _model.dateRangeFilter.last))
                                  .toList()
                                  .cast<TransactionStruct>();
                              safeSetState(() {});
                              _model.filterIncomePieChartData =
                                  await actions.mapTransactionToPieChartData(
                                _model.filterTransactions
                                    .where((e) =>
                                        e.typeId == TransactionType.Income.name)
                                    .toList(),
                                TransactionType.Income,
                              );
                              _model.filterExpensePieChartData =
                                  await actions.mapTransactionToPieChartData(
                                _model.filterTransactions
                                    .where((e) =>
                                        e.typeId ==
                                        TransactionType.Expense.name)
                                    .toList(),
                                TransactionType.Expense,
                              );
                              _model.incomePieChartData = _model
                                  .filterIncomePieChartData!
                                  .toList()
                                  .cast<DonutChartDataStruct>();
                              _model.expensePieChartData = _model
                                  .filterExpensePieChartData!
                                  .toList()
                                  .cast<DonutChartDataStruct>();
                              safeSetState(() {});

                              safeSetState(() {});
                            },
                            selectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              iconColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              iconSize: 18.0,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            unselectedChipStyle: ChipStyle(
                              backgroundColor:
                                  FlutterFlowTheme.of(context).alternate,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Prompt',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                  ),
                              iconColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              iconSize: 18.0,
                              labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            chipSpacing: 10.0,
                            rowSpacing: 10.0,
                            multiselect: false,
                            initialized: _model.choiceChipsValue != null,
                            alignment: WrapAlignment.start,
                            controller: _model.choiceChipsValueController ??=
                                FormFieldController<List<String>>(
                              ['เดือนนี้'],
                            ),
                            wrapped: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 340.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: const Alignment(0.0, 0),
                                  child: TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    unselectedLabelColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily: 'Kanit',
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                    unselectedLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily: 'Prompt',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                    indicatorColor:
                                        FlutterFlowTheme.of(context).primary,
                                    tabs: [
                                      const Tab(
                                        text: 'รายรับทั้งหมด',
                                      ).addWalkthrough(
                                        tabD9nmtut7,
                                        _model.reportPageController,
                                      ),
                                      const Tab(
                                        text: 'รายจ่ายทั้งหมด',
                                      ),
                                    ],
                                    controller: _model.tabBarController,
                                    onTap: (i) async {
                                      [() async {}, () async {}][i]();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TabBarView(
                                    controller: _model.tabBarController,
                                    children: [
                                      Builder(
                                        builder: (context) {
                                          if (_model.filterTransactions
                                              .where((e) =>
                                                  e.typeId ==
                                                  TransactionType.Income.name)
                                              .toList()
                                              .isNotEmpty) {
                                            return SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child: custom_widgets
                                                  .SyncFusionDonutChartTrans(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                chartData:
                                                    _model.incomePieChartData,
                                              ),
                                            );
                                          } else {
                                            return wrapWithModel(
                                              model:
                                                  _model.emptyListItemsModel1,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const EmptyListItemsWidget(
                                                title: 'ไม่มีข้อมูล',
                                                description:
                                                    'ไม่พบข้อมูลรายการการใช้จ่าย ณ เวลาที่ท่านเลือก',
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                      Builder(
                                        builder: (context) {
                                          if (_model.filterTransactions
                                              .where((e) =>
                                                  e.typeId ==
                                                  TransactionType.Expense.name)
                                              .toList()
                                              .isNotEmpty) {
                                            return SizedBox(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              child: custom_widgets
                                                  .SyncFusionDonutChartTrans(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                chartData:
                                                    _model.expensePieChartData,
                                              ),
                                            );
                                          } else {
                                            return wrapWithModel(
                                              model:
                                                  _model.emptyListItemsModel2,
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              child: const EmptyListItemsWidget(
                                                title: 'ไม่มีข้อมูล',
                                                description:
                                                    'ไม่พบข้อมูลรายการการใช้จ่าย ณ เวลาที่ท่านเลือก',
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
                          ),
                        ).addWalkthrough(
                          containerNiwv14v9,
                          _model.reportPageController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: 100.0,
                          height: 360.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Builder(
                              builder: (context) {
                                final itemsInList =
                                    (_model.tabBarCurrentIndex == 0
                                            ? _model.incomePieChartData
                                            : _model.expensePieChartData)
                                        .toList();
                                if (itemsInList.isEmpty) {
                                  return const EmptyListItemsWidget(
                                    title: 'ไม่มีข้อมูล',
                                    description:
                                        'ไม่พบข้อมูลรายการการใช้จ่าย ณ เวลาที่ท่านเลือก',
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  itemCount: itemsInList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 5.0),
                                  itemBuilder: (context, itemsInListIndex) {
                                    final itemsInListItem =
                                        itemsInList[itemsInListIndex];
                                    return Container(
                                      width: 100.0,
                                      height: 50.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      itemsInListItem
                                                          .categoryName,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    RichText(
                                                      textScaler:
                                                          MediaQuery.of(context)
                                                              .textScaler,
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: formatNumber(
                                                              itemsInListItem
                                                                  .value,
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                            ),
                                                            style: const TextStyle(),
                                                          ),
                                                          const TextSpan(
                                                            text: '%',
                                                            style: TextStyle(),
                                                          )
                                                        ],
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Prompt',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ].divide(const SizedBox(height: 2.0)),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      formatNumber(
                                                        itemsInListItem.total,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      ),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Kanit',
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            fontSize: 22.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ).addWalkthrough(
                          container3b841wqa,
                          _model.reportPageController,
                        ),
                      ),
                    ],
                  ),
                ].divide(const SizedBox(height: 15.0)),
              ),
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
          safeSetState(() => _model.reportPageController = null);
          FFAppState().initialReportWT = false;
        },
        onSkip: () {
          () async {
            FFAppState().initialReportWT = false;
          }();
          return true;
        },
      );
}
