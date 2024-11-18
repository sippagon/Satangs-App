import '/backend/schema/enums/enums.dart';
import '/componants/add_trans_options/add_trans_options_widget.dart';
import '/componants/empty_list_items/empty_list_items_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/home_page.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.initalOneMonthDateRange = await actions.getFilterDateRangeValue(
        DateFilterRange.oneMonth,
      );
      _model.endOfCurrMonth = _model.initalOneMonthDateRange?.last;
      _model.startOfCurrMonth = _model.initalOneMonthDateRange?.first;
      safeSetState(() {});
      if (FFAppState().InitialHomePageWT) {
        safeSetState(
            () => _model.homePageController = createPageWalkthrough(context));
        _model.homePageController?.show(context: context);
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
                await showDialog(
                  context: context,
                  builder: (alertDialogContext) {
                    return AlertDialog(
                      title: const Text('ไม่มีบัญชี'),
                      content: const Text(
                          'กรุณาสร้างบัญชี อย่างน้อย 1 บัญชี ก่อนสร้างรายการใช้จ่าย'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(alertDialogContext),
                          child: const Text('ตกลง'),
                        ),
                      ],
                    );
                  },
                );
                if (Navigator.of(context).canPop()) {
                  context.pop();
                }
                context.pushNamed('AccountPage');
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
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, -1.0),
            child: Text(
              'ภาพรวม',
              textAlign: TextAlign.start,
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Kanit',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ยอดคงเหลือ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Kanit',
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        RichText(
                                          textScaler:
                                              MediaQuery.of(context).textScaler,
                                          text: TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: 'รอบวันที่ ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "d/M/y",
                                                    _model.startOfCurrMonth,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  'วันที่เริ่ม',
                                                ),
                                                style: const TextStyle(),
                                              ),
                                              const TextSpan(
                                                text: ' - ',
                                                style: TextStyle(),
                                              ),
                                              TextSpan(
                                                text: valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "d/M/y",
                                                    _model.endOfCurrMonth,
                                                    locale: FFLocalizations.of(
                                                            context)
                                                        .languageCode,
                                                  ),
                                                  'วันสุดท้าย',
                                                ),
                                                style: const TextStyle(),
                                              )
                                            ],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Prompt',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  fontSize: 11.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: formatNumber(
                                              functions.sumCurrentAmount(FFAppState()
                                                      .Transactions
                                                      .where((e) =>
                                                          (e.date! >= _model.initalOneMonthDateRange!.first) &&
                                                          (e.date! <=
                                                              _model
                                                                  .initalOneMonthDateRange!
                                                                  .last) &&
                                                          (e.typeId ==
                                                              TransactionType
                                                                  .Income.name))
                                                      .toList()
                                                      .map((e) => e.amount)
                                                      .toList()) -
                                                  functions.sumCurrentAmount(FFAppState()
                                                      .Transactions
                                                      .where((e) =>
                                                          (e.date! >= _model.initalOneMonthDateRange!.first) &&
                                                          (e.date! <=
                                                              _model
                                                                  .initalOneMonthDateRange!
                                                                  .last) &&
                                                          (e.typeId ==
                                                              TransactionType
                                                                  .Expense
                                                                  .name))
                                                      .toList()
                                                      .map((e) => e.amount)
                                                      .toList()),
                                              formatType: FormatType.decimal,
                                              decimalType:
                                                  DecimalType.periodDecimal,
                                            ),
                                            style: GoogleFonts.getFont(
                                              'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const TextSpan(
                                            text: ' บาท',
                                            style: TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Prompt',
                                              fontSize: 24.0,
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
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'รายได้',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Prompt',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: formatNumber(
                                                          functions.sumCurrentAmount(FFAppState()
                                                              .Transactions
                                                              .where((e) =>
                                                                  (e.date! >= _model.initalOneMonthDateRange!.first) &&
                                                                  (e.date! <=
                                                                      _model
                                                                          .initalOneMonthDateRange!
                                                                          .last) &&
                                                                  (e.typeId ==
                                                                      TransactionType
                                                                          .Income
                                                                          .name))
                                                              .toList()
                                                              .map((e) =>
                                                                  e.amount)
                                                              .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                        ),
                                                      ),
                                                      const TextSpan(
                                                        text: ' บาท',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'รายจ่าย',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Prompt',
                                                        fontSize: 14.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                RichText(
                                                  textScaler:
                                                      MediaQuery.of(context)
                                                          .textScaler,
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: formatNumber(
                                                          functions.sumCurrentAmount(FFAppState()
                                                              .Transactions
                                                              .where((e) =>
                                                                  (e.date! >= _model.initalOneMonthDateRange!.first) &&
                                                                  (e.date! <=
                                                                      _model
                                                                          .initalOneMonthDateRange!
                                                                          .last) &&
                                                                  (e.typeId ==
                                                                      TransactionType
                                                                          .Expense
                                                                          .name))
                                                              .toList()
                                                              .map((e) =>
                                                                  e.amount)
                                                              .toList()),
                                                          formatType: FormatType
                                                              .decimal,
                                                          decimalType:
                                                              DecimalType
                                                                  .periodDecimal,
                                                        ),
                                                        style: TextStyle(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                        ),
                                                      ),
                                                      const TextSpan(
                                                        text: ' บาท',
                                                        style: TextStyle(
                                                          fontSize: 14.0,
                                                        ),
                                                      )
                                                    ],
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Prompt',
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).addWalkthrough(
                          containerA3v8zusq,
                          _model.homePageController,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) {
                            if (!FFAppState().InitialWealth) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('WealthInfoPage');
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
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
                                                        'ความมั่งคั่งสุทธิ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Kanit',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'เกณฑ์มาตรฐานควรมีค่าเป็นบวก',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Prompt',
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          formatNumber(
                                                            FFAppState()
                                                                    .WealthInfo
                                                                    .totalAssets -
                                                                FFAppState()
                                                                    .WealthInfo
                                                                    .totalDebt,
                                                            formatType:
                                                                FormatType
                                                                    .decimal,
                                                            decimalType:
                                                                DecimalType
                                                                    .periodDecimal,
                                                          ),
                                                          '0',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 15,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Kanit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      28.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Lottie.network(
                                                  'https://lottie.host/5b291c85-04e9-4159-8746-319d439f05e0/ARUpVTqzvc.json',
                                                  width: 100.0,
                                                  height: 120.0,
                                                  fit: BoxFit.fill,
                                                  animate: true,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.pushNamed('AddWealthInfoPage');
                                },
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'ความมั่งคั่งสุทธิ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Kanit',
                                                              fontSize: 22.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'ข้อมูลไม่เพียงพอต่อการวิเคราะห์',
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
                                                                  letterSpacing:
                                                                      0.0,
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
                                                          'กรุณากรอกข้อมูลเพิ่มเติมเพื่อวิเคราะห์ผลลัพธ์',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Prompt',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Icon(
                                                  Icons.chevron_right,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 24.0,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ).addWalkthrough(
                                container29dp03ty,
                                _model.homePageController,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 450.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
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
                                            'รายการใช้จ่ายวันนี้',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Kanit',
                                                  fontSize: 22.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          borderRadius: 20.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.chevron_right_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 24.0,
                                          ),
                                          onPressed: () async {
                                            context.goNamed(
                                              'TransactionHistoryPage',
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
                                        ).addWalkthrough(
                                          iconButtonPst1w8en,
                                          _model.homePageController,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 0.0),
                                    child: Builder(
                                      builder: (context) {
                                        final todayTransList = functions
                                                .filterOnlyTodayTrans(
                                                    FFAppState()
                                                        .Transactions
                                                        .toList())
                                                ?.toList() ??
                                            [];
                                        if (todayTransList.isEmpty) {
                                          return const EmptyListItemsWidget(
                                            title: 'ไม่มีรายการ',
                                            description:
                                                'ไม่พบรายการใช้จ่ายสำหรับวันนี้',
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          primary: false,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: todayTransList.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(height: 10.0),
                                          itemBuilder:
                                              (context, todayTransListIndex) {
                                            final todayTransListItem =
                                                todayTransList[
                                                    todayTransListIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                if (todayTransListItem.typeId ==
                                                    TransactionType
                                                        .Transfer.name) {
                                                  context.pushNamed(
                                                    'EditTransTransferPage',
                                                    queryParameters: {
                                                      'transactionData':
                                                          serializeParam(
                                                        todayTransListItem,
                                                        ParamType.DataStruct,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .scale,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                      ),
                                                    },
                                                  );

                                                  return;
                                                } else {
                                                  context.pushNamed(
                                                    'EditTransPage',
                                                    queryParameters: {
                                                      'transactionData':
                                                          serializeParam(
                                                        todayTransListItem,
                                                        ParamType.DataStruct,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          const TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .scale,
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                      ),
                                                    },
                                                  );

                                                  return;
                                                }
                                              },
                                              child: Container(
                                                width: 100.0,
                                                height: 70.0,
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
                                                        .primaryBackground,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                              todayTransListItem.categoryId ==
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
                                                                              todayTransListItem.categoryId ==
                                                                              e.guid)
                                                                          .toList()
                                                                          .first
                                                                          .name;
                                                                    } else {
                                                                      return 'โอนเงิน';
                                                                    }
                                                                  }(),
                                                                  'Test',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Text(
                                                                dateTimeFormat(
                                                                  "Hm",
                                                                  todayTransListItem
                                                                      .date!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
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
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Kanit',
                                                                      color:
                                                                          () {
                                                                        if (todayTransListItem.typeId ==
                                                                            TransactionType
                                                                                .Income.name) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondary;
                                                                        } else if (todayTransListItem.typeId ==
                                                                            TransactionType.Expense.name) {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .error;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .secondaryText;
                                                                        }
                                                                      }(),
                                                                      fontSize:
                                                                          16.0,
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Builder(
                                                                builder:
                                                                    (context) {
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
                                                                              todayTransListItem.accountId)
                                                                          .toList()
                                                                          .first
                                                                          .name,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Prompt',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                          ),
                                                                    );
                                                                  } else {
                                                                    return RichText(
                                                                      textScaler:
                                                                          MediaQuery.of(context)
                                                                              .textScaler,
                                                                      text:
                                                                          TextSpan(
                                                                        children: [
                                                                          TextSpan(
                                                                            text:
                                                                                FFAppState().AccountList.where((e) => e.guid == todayTransListItem.accountId).toList().first.name,
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
                                                                            text:
                                                                                FFAppState().AccountList.where((e) => e.guid == todayTransListItem.targetAccountId).toList().first.name,
                                                                            style:
                                                                                const TextStyle(),
                                                                          )
                                                                        ],
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Prompt',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
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
                                            ).addWalkthrough(
                                              container8luhxp9y,
                                              _model.homePageController,
                                              listIndex: todayTransListIndex,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).addWalkthrough(
                          containerY9wnxm10,
                          _model.homePageController,
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
          safeSetState(() => _model.homePageController = null);
          FFAppState().InitialHomePageWT = false;
        },
        onSkip: () {
          () async {
            FFAppState().InitialHomePageWT = false;
          }();
          return true;
        },
      );
}
