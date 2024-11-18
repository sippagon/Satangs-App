import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/componants/add_trans_options/add_trans_options_widget.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/walkthroughs/transaction_history_page.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'transaction_history_page_model.dart';
export 'transaction_history_page_model.dart';

class TransactionHistoryPageWidget extends StatefulWidget {
  const TransactionHistoryPageWidget({super.key});

  @override
  State<TransactionHistoryPageWidget> createState() =>
      _TransactionHistoryPageWidgetState();
}

class _TransactionHistoryPageWidgetState
    extends State<TransactionHistoryPageWidget> {
  late TransactionHistoryPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TransactionHistoryPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dateRangeResults = await actions.getFilterDateRangeValue(
        DateFilterRange.oneMonth,
      );
      _model.filterTransactions = FFAppState()
          .Transactions
          .where((e) =>
              (e.date! >= _model.dateRangeResults!.first) &&
              (e.date! <= _model.dateRangeResults!.last))
          .toList()
          .toList()
          .cast<TransactionStruct>();
      safeSetState(() {});
      if (FFAppState().initialTransactionHistoryPageWT) {
        safeSetState(() => _model.transactionHistoryPageController =
            createPageWalkthrough(context));
        _model.transactionHistoryPageController?.show(context: context);
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
        floatingActionButton: Align(
          alignment: const AlignmentDirectional(1.0, 1.0),
          child: FloatingActionButton.extended(
            onPressed: () async {
              if (FFAppState()
                  .AccountList
                  .where((e) => e.active)
                  .toList()
                  .isNotEmpty) {
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
                        child: const AddTransOptionsWidget(),
                      ),
                    );
                  },
                ).then((value) => safeSetState(() {}));

                return;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'โปรดสร้างบัญชีอย่างน้อย 1 บัญชี',
                      style: TextStyle(
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).warning,
                  ),
                );
                return;
              }
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
        ),
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: FlutterFlowIconButton(
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
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'รายการใช้จ่าย',
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
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowChoiceChips(
                            options: const [
                              ChipData('เดือนนี้'),
                              ChipData('3 เดือนล่าสุด'),
                              ChipData('ปีนี้'),
                              ChipData('เลือกเอง'),
                              ChipData('ทั้งหมด')
                            ],
                            onChanged: (val) async {
                              safeSetState(() =>
                                  _model.choiceChipsValue = val?.firstOrNull);
                              var shouldSetState = false;
                              if (_model.choiceChipsValue == 'ทั้งหมด') {
                                _model.filterTransactions = FFAppState()
                                    .Transactions
                                    .toList()
                                    .cast<TransactionStruct>();
                                safeSetState(() {});
                                if (shouldSetState) safeSetState(() {});
                                return;
                              } else {
                                if (_model.choiceChipsValue == 'เลือกเอง') {
                                  _model.outputDateRange =
                                      await actions.showCustomDateRange(
                                    context,
                                  );
                                  shouldSetState = true;
                                  _model.dateRangeValue = _model
                                      .outputDateRange!
                                      .toList()
                                      .cast<DateTime>();
                                  safeSetState(() {});
                                } else {
                                  _model.selectedDateRange =
                                      await actions.getFilterDateRangeValue(
                                    () {
                                      if (_model.choiceChipsValue ==
                                          'เดือนนี้') {
                                        return DateFilterRange.oneMonth;
                                      } else if (_model.choiceChipsValue ==
                                          '3 เดือนล่าสุด') {
                                        return DateFilterRange.threeMonth;
                                      } else {
                                        return DateFilterRange.thisYear;
                                      }
                                    }(),
                                  );
                                  shouldSetState = true;
                                  _model.dateRangeValue = _model
                                      .selectedDateRange!
                                      .toList()
                                      .cast<DateTime>();
                                  safeSetState(() {});
                                }

                                _model.filterTransactions = FFAppState()
                                    .Transactions
                                    .where((e) =>
                                        (e.date! >=
                                            _model.dateRangeValue.first) &&
                                        (e.date! <= _model.dateRangeValue.last))
                                    .toList()
                                    .cast<TransactionStruct>();
                                safeSetState(() {});
                                if (shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (shouldSetState) safeSetState(() {});
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
                          ).addWalkthrough(
                            choiceChips6bv51esv,
                            _model.transactionHistoryPageController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: 100.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                            ),
                            child: Builder(
                              builder: (context) {
                                final todayTransList = functions
                                    .sortTransactionList(
                                        _model.filterTransactions.toList())
                                    .toList();
                                if (todayTransList.isEmpty) {
                                  return const EmptyListItemsWidget(
                                    title: 'ไม่มีรายการ',
                                    description:
                                        'ไม่พบรายการใช้จ่ายสำหรับวันนี้',
                                  );
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: todayTransList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 10.0),
                                  itemBuilder: (context, todayTransListIndex) {
                                    final todayTransListItem =
                                        todayTransList[todayTransListIndex];
                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'EditTransPage',
                                          queryParameters: {
                                            'transactionData': serializeParam(
                                              todayTransListItem,
                                              ParamType.DataStruct,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.scale,
                                              alignment: Alignment.bottomCenter,
                                            ),
                                          },
                                        );
                                      },
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Container(
                                          width: 100.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          valueOrDefault<
                                                              String>(
                                                            () {
                                                              if (todayTransListItem
                                                                      .typeId ==
                                                                  TransactionType
                                                                      .Income
                                                                      .name) {
                                                                return FFAppState()
                                                                    .TransCatIncomes
                                                                    .where((e) =>
                                                                        todayTransListItem
                                                                            .categoryId ==
                                                                        e.guid)
                                                                    .toList()
                                                                    .first
                                                                    .name;
                                                              } else if (todayTransListItem
                                                                      .typeId ==
                                                                  TransactionType
                                                                      .Expense
                                                                      .name) {
                                                                return FFAppState()
                                                                    .TransCatExpenses
                                                                    .where((e) =>
                                                                        todayTransListItem
                                                                            .categoryId ==
                                                                        e.guid)
                                                                    .toList()
                                                                    .first
                                                                    .name;
                                                              } else {
                                                                return 'โอนเงิน';
                                                              }
                                                            }(),
                                                            'ไม่มีหมวดหมู่',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          dateTimeFormat(
                                                            "dd/MM/yyyy HH:mm",
                                                            todayTransListItem
                                                                .date!,
                                                            locale: FFLocalizations
                                                                    .of(context)
                                                                .languageCode,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Prompt',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Text(
                                                          formatNumber(
                                                            todayTransListItem
                                                                .amount,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          ).maybeHandleOverflow(
                                                            maxChars: 7,
                                                            replacement: '…',
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Kanit',
                                                                color: () {
                                                                  if (todayTransListItem
                                                                          .typeId ==
                                                                      TransactionType
                                                                          .Income
                                                                          .name) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary;
                                                                  } else if (todayTransListItem
                                                                          .typeId ==
                                                                      TransactionType
                                                                          .Expense
                                                                          .name) {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .error;
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText;
                                                                  }
                                                                }(),
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
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Builder(
                                                          builder: (context) {
                                                            if (todayTransListItem
                                                                    .typeId !=
                                                                TransactionType
                                                                    .Transfer
                                                                    .name) {
                                                              return Text(
                                                                FFAppState()
                                                                    .AccountList
                                                                    .where((e) =>
                                                                        e.guid ==
                                                                        todayTransListItem
                                                                            .accountId)
                                                                    .toList()
                                                                    .first
                                                                    .name,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Prompt',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              );
                                                            } else {
                                                              return RichText(
                                                                textScaler: MediaQuery.of(
                                                                        context)
                                                                    .textScaler,
                                                                text: TextSpan(
                                                                  children: [
                                                                    TextSpan(
                                                                      text: FFAppState()
                                                                          .AccountList
                                                                          .where((e) =>
                                                                              e.guid ==
                                                                              todayTransListItem.accountId)
                                                                          .toList()
                                                                          .first
                                                                          .name,
                                                                      style:
                                                                          const TextStyle(),
                                                                    ),
                                                                    const TextSpan(
                                                                      text:
                                                                          ' -> ',
                                                                      style:
                                                                          TextStyle(),
                                                                    ),
                                                                    TextSpan(
                                                                      text: FFAppState()
                                                                          .AccountList
                                                                          .where((e) =>
                                                                              e.guid ==
                                                                              todayTransListItem.targetAccountId)
                                                                          .toList()
                                                                          .first
                                                                          .name,
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
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ).addWalkthrough(
                                      containerS6ygo5gs,
                                      _model.transactionHistoryPageController,
                                      listIndex: todayTransListIndex,
                                    );
                                  },
                                ).addWalkthrough(
                                  listViewW4d3p1sg,
                                  _model.transactionHistoryPageController,
                                );
                              },
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
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.transactionHistoryPageController = null);
          FFAppState().initialTransactionHistoryPageWT = false;
        },
        onSkip: () {
          () async {
            FFAppState().initialTransactionHistoryPageWT = false;
          }();
          return true;
        },
      );
}
