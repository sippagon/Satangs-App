import '/backend/schema/structs/index.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'goal_saving_data_table_page_model.dart';
export 'goal_saving_data_table_page_model.dart';

class GoalSavingDataTablePageWidget extends StatefulWidget {
  const GoalSavingDataTablePageWidget({
    super.key,
    required this.dataTable,
    required this.targetAmount,
  });

  final List<GoalMonthSavingDataTableStruct>? dataTable;
  final double? targetAmount;

  @override
  State<GoalSavingDataTablePageWidget> createState() =>
      _GoalSavingDataTablePageWidgetState();
}

class _GoalSavingDataTablePageWidgetState
    extends State<GoalSavingDataTablePageWidget> {
  late GoalSavingDataTablePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GoalSavingDataTablePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'ตารางแสดงผลการประเมิน',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    final items = widget.dataTable!.toList();
                    if (items.isEmpty) {
                      return const EmptyListItemsWidget(
                        title: 'ไม่พบข้อมูล',
                        description: 'ไม่พบรายการข้อมูลใดๆ ที่จะนำมาแสดง',
                      );
                    }

                    return FlutterFlowDataTable<GoalMonthSavingDataTableStruct>(
                      controller: _model.paginatedDataTableController,
                      data: items,
                      columnsBuilder: (onSortChanged) => [
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'งวดที่',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'รายรับ',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'รายจ่าย',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'คงเหลือ',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        DataColumn2(
                          label: DefaultTextStyle.merge(
                            softWrap: true,
                            child: Text(
                              'ยอดสะสม',
                              style: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .override(
                                    fontFamily: 'Kanit',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                      ],
                      dataRowBuilder:
                          (itemsItem, itemsIndex, selected, onSelectChanged) =>
                              DataRow(
                        color: WidgetStateProperty.all(
                          itemsIndex % 2 == 0
                              ? FlutterFlowTheme.of(context).secondaryBackground
                              : FlutterFlowTheme.of(context).primaryBackground,
                        ),
                        cells: [
                          Text(
                            formatNumber(
                              itemsItem.month,
                              formatType: FormatType.custom,
                              format: '#',
                              locale: '',
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Prompt',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                itemsItem.income,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Prompt',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                itemsItem.expense,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Prompt',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                itemsItem.savings,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Prompt',
                                  letterSpacing: 0.0,
                                ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              formatNumber(
                                itemsItem.balance,
                                formatType: FormatType.decimal,
                                decimalType: DecimalType.periodDecimal,
                              ),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Prompt',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ].map((c) => DataCell(c)).toList(),
                      ),
                      emptyBuilder: () => const EmptyListItemsWidget(
                        title: 'ไม่พบข้อมูล',
                        description: 'ไม่พบรายการข้อมูลใดๆ ที่จะนำมาแสดง',
                      ),
                      paginated: false,
                      selectable: false,
                      width: double.infinity,
                      minWidth: 550.0,
                      headingRowHeight: 56.0,
                      dataRowHeight: 48.0,
                      columnSpacing: 20.0,
                      headingRowColor: FlutterFlowTheme.of(context).primary,
                      borderRadius: BorderRadius.circular(0.0),
                      addHorizontalDivider: true,
                      addTopAndBottomDivider: false,
                      hideDefaultHorizontalDivider: true,
                      horizontalDividerColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      horizontalDividerThickness: 1.0,
                      addVerticalDivider: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
