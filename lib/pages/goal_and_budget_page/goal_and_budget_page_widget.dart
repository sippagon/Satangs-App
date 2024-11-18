import '/backend/schema/enums/enums.dart';
import '/componants/add_goal_or_budget/add_goal_or_budget_widget.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/goal_and_budget_page.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'goal_and_budget_page_model.dart';
export 'goal_and_budget_page_model.dart';

class GoalAndBudgetPageWidget extends StatefulWidget {
  const GoalAndBudgetPageWidget({super.key});

  @override
  State<GoalAndBudgetPageWidget> createState() =>
      _GoalAndBudgetPageWidgetState();
}

class _GoalAndBudgetPageWidgetState extends State<GoalAndBudgetPageWidget>
    with TickerProviderStateMixin {
  late GoalAndBudgetPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalAndBudgetPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.oneMonthDateRange = await actions.getFilterDateRangeValue(
        DateFilterRange.oneMonth,
      );
      if (FFAppState().initialGoalBudgetWT) {
        safeSetState(() => _model.goalAndBudgetPageController =
            createPageWalkthrough(context));
        _model.goalAndBudgetPageController?.show(context: context);
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
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Padding(
                    padding: MediaQuery.viewInsetsOf(context),
                    child: const AddGoalOrBudgetWidget(),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          icon: const Icon(
            Icons.add,
          ),
          elevation: 8.0,
          label: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'เพิ่มรายการ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Kanit',
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'เป้าหมายและแผนค่าใช้จ่าย',
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: const Alignment(0.0, 0),
                            child: TabBar(
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Kanit',
                                    letterSpacing: 0.0,
                                  ),
                              unselectedLabelStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Prompt',
                                    letterSpacing: 0.0,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).primary,
                              padding: const EdgeInsets.all(4.0),
                              tabs: [
                                const Tab(
                                  text: 'เป้าหมาย',
                                ).addWalkthrough(
                                  tabSevb4ckd,
                                  _model.goalAndBudgetPageController,
                                ),
                                const Tab(
                                  text: 'แผนค่าใช้จ่าย',
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
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final goalsitems =
                                          FFAppState().Goals.toList();
                                      if (goalsitems.isEmpty) {
                                        return const EmptyListItemsWidget(
                                          title: 'ไม่พบรายการเป้าหมายการเงิน',
                                          description:
                                              'ไม่มีรายการเป้าหมายการเงินที่บันทึกเอาไว้',
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: goalsitems.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, goalsitemsIndex) {
                                          final goalsitemsItem =
                                              goalsitems[goalsitemsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'GoalDetailsPage',
                                                queryParameters: {
                                                  'goalGuid': serializeParam(
                                                    goalsitemsItem.guid,
                                                    ParamType.String,
                                                  ),
                                                  'goalIndex': serializeParam(
                                                    goalsitemsIndex,
                                                    ParamType.int,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 130.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          goalsitemsItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons.chevron_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 22.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (!goalsitemsItem
                                                                .isFinished) {
                                                              return RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    const TextSpan(
                                                                      text:
                                                                          'เหลืออีก ',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: valueOrDefault<
                                                                          String>(
                                                                        formatNumber(
                                                                          functions
                                                                              .calculateDaysDiffFromPresent(goalsitemsItem.targetDate!),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        ),
                                                                        '0',
                                                                      ),
                                                                      style:
                                                                          const TextStyle(),
                                                                    ),
                                                                    const TextSpan(
                                                                      text:
                                                                          ' วัน จะถึงวันที่ ',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text:
                                                                          dateTimeFormat(
                                                                        "d/M/y",
                                                                        goalsitemsItem
                                                                            .targetDate!,
                                                                        locale:
                                                                            FFLocalizations.of(context).languageCode,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              );
                                                            } else {
                                                              return Text(
                                                                'คุณทำเป้าหมายนี้สำเร็จแล้ว!',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Prompt',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                LinearPercentIndicator(
                                                              percent:
                                                                  valueOrDefault<
                                                                      double>(
                                                                goalsitemsItem
                                                                    .progressPercatage,
                                                                0.0,
                                                              ),
                                                              lineHeight: 26.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              center: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  formatNumber(
                                                                    goalsitemsItem
                                                                        .progressPercatage,
                                                                    formatType:
                                                                        FormatType
                                                                            .percent,
                                                                  ),
                                                                  '0',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Prompt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              barRadius: const Radius
                                                                  .circular(
                                                                      10.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        RichText(
                                                          textScaler:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaler,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    formatNumber(
                                                                  goalsitemsItem
                                                                      .currentBalance,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                                ),
                                                              ),
                                                              const TextSpan(
                                                                text: ' / ',
                                                                style:
                                                                    TextStyle(),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    formatNumber(
                                                                  goalsitemsItem
                                                                      .targetAmount,
                                                                  formatType:
                                                                      FormatType
                                                                          .decimal,
                                                                  decimalType:
                                                                      DecimalType
                                                                          .periodDecimal,
                                                                ),
                                                                style:
                                                                    const TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Prompt',
                                                                  fontSize:
                                                                      14.0,
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
                                            ),
                                          );
                                        },
                                      ).addWalkthrough(
                                        listViewEpffeft9,
                                        _model.goalAndBudgetPageController,
                                      );
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: Builder(
                                    builder: (context) {
                                      final budgetsitems = FFAppState()
                                          .Budgets
                                          .sortedList(
                                              keyOf: (e) =>
                                                  e.createOnLocalTime!,
                                              desc: true)
                                          .toList();
                                      if (budgetsitems.isEmpty) {
                                        return const EmptyListItemsWidget(
                                          title: 'ไม่พบรายการเป้าหมายการเงิน',
                                          description:
                                              'ไม่มีรายการเป้าหมายการเงินที่บันทึกเอาไว้',
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        itemCount: budgetsitems.length,
                                        separatorBuilder: (_, __) =>
                                            const SizedBox(height: 10.0),
                                        itemBuilder:
                                            (context, budgetsitemsIndex) {
                                          final budgetsitemsItem =
                                              budgetsitems[budgetsitemsIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'BudgetDetailsPage',
                                                queryParameters: {
                                                  'budgetGuid': serializeParam(
                                                    budgetsitemsItem.guid,
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Container(
                                              width: 100.0,
                                              height: 110.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
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
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          budgetsitemsItem.name,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                        Icon(
                                                          Icons.chevron_right,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          size: 22.0,
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  5.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                LinearPercentIndicator(
                                                              percent: FFAppState()
                                                                      .Transactions
                                                                      .isNotEmpty
                                                                  ? valueOrDefault<
                                                                      double>(
                                                                      (double usageAmount,
                                                                              double
                                                                                  budgetAmount) {
                                                                        return usageAmount <=
                                                                                budgetAmount
                                                                            ? (usageAmount /
                                                                                budgetAmount)
                                                                            : 1.0;
                                                                      }(
                                                                          functions.getSumOfBudgetTransaction(
                                                                              budgetsitemsItem.includeCategories.map((e) => e.guid).toList(),
                                                                              FFAppState().Transactions.where((e) => (e.typeId == TransactionType.Expense.name) && ((e.date! >= _model.oneMonthDateRange!.first) && (e.date! <= _model.oneMonthDateRange!.last))).toList()),
                                                                          budgetsitemsItem.totalBudget),
                                                                      0.0,
                                                                    )
                                                                  : 0.0,
                                                              lineHeight: 26.0,
                                                              animation: true,
                                                              animateFromLastPercent:
                                                                  true,
                                                              progressColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                              center: Text(
                                                                formatNumber(
                                                                  FFAppState()
                                                                          .Transactions
                                                                          .isNotEmpty
                                                                      ? valueOrDefault<
                                                                          double>(
                                                                          (double usageAmount,
                                                                              double budgetAmount) {
                                                                            return usageAmount <= budgetAmount
                                                                                ? (usageAmount / budgetAmount)
                                                                                : 1.0;
                                                                          }(functions.getSumOfBudgetTransaction(budgetsitemsItem.includeCategories.map((e) => e.guid).toList(), FFAppState().Transactions.where((e) => (e.typeId == TransactionType.Expense.name) && ((e.date! >= _model.oneMonthDateRange!.first) && (e.date! <= _model.oneMonthDateRange!.last))).toList()), budgetsitemsItem.totalBudget),
                                                                          0.0,
                                                                        )
                                                                      : 0.0,
                                                                  formatType:
                                                                      FormatType
                                                                          .percent,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Prompt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                              ),
                                                              barRadius: const Radius
                                                                  .circular(
                                                                      10.0),
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
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
                                                                      'ใช้ไปแล้วทั้งสิน ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text: FFAppState()
                                                                          .Transactions
                                                                          .isNotEmpty
                                                                      ? formatNumber(
                                                                          functions.getSumOfBudgetTransaction(
                                                                              budgetsitemsItem.includeCategories.map((e) => e.guid).toList(),
                                                                              FFAppState().Transactions.where((e) => (e.typeId == TransactionType.Expense.name) && ((e.date! >= _model.oneMonthDateRange!.first) && (e.date! <= _model.oneMonthDateRange!.last))).toList()),
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.periodDecimal,
                                                                        )
                                                                      : '0',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                  ),
                                                                ),
                                                                const TextSpan(
                                                                  text: ' / ',
                                                                  style:
                                                                      TextStyle(),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      formatNumber(
                                                                    budgetsitemsItem
                                                                        .totalBudget,
                                                                    formatType:
                                                                        FormatType
                                                                            .decimal,
                                                                    decimalType:
                                                                        DecimalType
                                                                            .periodDecimal,
                                                                  ),
                                                                  style:
                                                                      const TextStyle(),
                                                                )
                                                              ],
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Prompt',
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
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
                                        },
                                      );
                                    },
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
          safeSetState(() => _model.goalAndBudgetPageController = null);
          FFAppState().initialGoalBudgetWT = false;
        },
        onSkip: () {
          () async {
            FFAppState().initialGoalBudgetWT = false;
          }();
          return true;
        },
      );
}
