import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => const NavBarPage(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => const NavBarPage(),
        ),
        FFRoute(
          name: 'HomePage',
          path: '/homePage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'HomePage')
              : const HomePageWidget(),
        ),
        FFRoute(
          name: 'AccountPage',
          path: '/accountPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'AccountPage')
              : const AccountPageWidget(),
        ),
        FFRoute(
          name: 'TransactionHistoryPage',
          path: '/transactionHistoryPage',
          builder: (context, params) => const TransactionHistoryPageWidget(),
        ),
        FFRoute(
          name: 'DebugActionPage',
          path: '/debugActionPage',
          builder: (context, params) => const DebugActionPageWidget(),
        ),
        FFRoute(
          name: 'StatisticPage',
          path: '/statisticPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'StatisticPage')
              : const StatisticPageWidget(),
        ),
        FFRoute(
          name: 'GoalAndBudgetPage',
          path: '/goalAndBudgetPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'GoalAndBudgetPage')
              : const GoalAndBudgetPageWidget(),
        ),
        FFRoute(
          name: 'AddGoalPage',
          path: '/addGoalPage',
          builder: (context, params) => const AddGoalPageWidget(),
        ),
        FFRoute(
          name: 'AddGoalConfirmPage',
          path: '/addGoalConfirmPage',
          builder: (context, params) => const AddGoalConfirmPageWidget(),
        ),
        FFRoute(
          name: 'AddGoalIncomePage',
          path: '/addGoalIncomePage',
          builder: (context, params) => const AddGoalIncomePageWidget(),
        ),
        FFRoute(
          name: 'GoalDetailsPage',
          path: '/goalDetailsPage',
          builder: (context, params) => GoalDetailsPageWidget(
            goalGuid: params.getParam(
              'goalGuid',
              ParamType.String,
            ),
            goalIndex: params.getParam(
              'goalIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'EditGoalPage',
          path: '/editGoalPage',
          builder: (context, params) => EditGoalPageWidget(
            goalUpdateIndex: params.getParam(
              'goalUpdateIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'EditGoalIncomePage',
          path: '/editGoalIncomePage',
          builder: (context, params) => EditGoalIncomePageWidget(
            goalUpdateIndex: params.getParam(
              'goalUpdateIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'EditGoalConfirmPage',
          path: '/editGoalConfirmPage',
          builder: (context, params) => EditGoalConfirmPageWidget(
            goalUpdateIndex: params.getParam(
              'goalUpdateIndex',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: 'GoalSavingDataTablePage',
          path: '/goalSavingDataTablePage',
          builder: (context, params) => GoalSavingDataTablePageWidget(
            dataTable: params.getParam<GoalMonthSavingDataTableStruct>(
              'dataTable',
              ParamType.DataStruct,
              isList: true,
              structBuilder: GoalMonthSavingDataTableStruct.fromSerializableMap,
            ),
            targetAmount: params.getParam(
              'targetAmount',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: 'AddBudgetPage',
          path: '/addBudgetPage',
          builder: (context, params) => const AddBudgetPageWidget(),
        ),
        FFRoute(
          name: 'AddBudgetAllocatePage',
          path: '/addBudgetAllocatePage',
          builder: (context, params) => const AddBudgetAllocatePageWidget(),
        ),
        FFRoute(
          name: 'AddBudgetConfirmPage',
          path: '/addBudgetConfirmPage',
          builder: (context, params) => const AddBudgetConfirmPageWidget(),
        ),
        FFRoute(
          name: 'BudgetDetailsPage',
          path: '/budgetDetailsPage',
          builder: (context, params) => BudgetDetailsPageWidget(
            budgetGuid: params.getParam(
              'budgetGuid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditBudgetPage',
          path: '/editBudgetPage',
          builder: (context, params) => const EditBudgetPageWidget(),
        ),
        FFRoute(
          name: 'EditBudgetAllocatePage',
          path: '/editBudgetAllocatePage',
          builder: (context, params) => const EditBudgetAllocatePageWidget(),
        ),
        FFRoute(
          name: 'EditBudgetConfirmPage',
          path: '/editBudgetConfirmPage',
          builder: (context, params) => const EditBudgetConfirmPageWidget(),
        ),
        FFRoute(
          name: 'AddWealthInfoPage',
          path: '/addWealthInfoPage',
          builder: (context, params) => const AddWealthInfoPageWidget(),
        ),
        FFRoute(
          name: 'WealthInfoPage',
          path: '/wealthInfoPage',
          builder: (context, params) => const WealthInfoPageWidget(),
        ),
        FFRoute(
          name: 'EditWealthInfoPage',
          path: '/editWealthInfoPage',
          builder: (context, params) => const EditWealthInfoPageWidget(),
        ),
        FFRoute(
          name: 'EditWealthAdditionalInfoPage',
          path: '/editWealthAdditionalInfoPage',
          builder: (context, params) => const EditWealthAdditionalInfoPageWidget(),
        ),
        FFRoute(
          name: 'RetirementPersonalFormPage',
          path: '/retirementPersonalFormPage',
          builder: (context, params) => const RetirementPersonalFormPageWidget(),
        ),
        FFRoute(
          name: 'RetirementFinancialFormPage',
          path: '/retirementFinancialFormPage',
          builder: (context, params) => const RetirementFinancialFormPageWidget(),
        ),
        FFRoute(
          name: 'RetirementSavingsFormPage',
          path: '/retirementSavingsFormPage',
          builder: (context, params) => const RetirementSavingsFormPageWidget(),
        ),
        FFRoute(
          name: 'RetirementResultPage',
          path: '/retirementResultPage',
          builder: (context, params) => RetirementResultPageWidget(
            viewModel: params.getParam(
              'viewModel',
              ParamType.DataStruct,
              isList: false,
              structBuilder:
                  RetirementCalculationResultModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'OtherMenuPage',
          path: '/otherMenuPage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'OtherMenuPage')
              : const OtherMenuPageWidget(),
        ),
        FFRoute(
          name: 'TaxsPlanManagementPage',
          path: '/taxsPlanManagementPage',
          builder: (context, params) => const TaxsPlanManagementPageWidget(),
        ),
        FFRoute(
          name: 'TaxesPersonalInfoFormPage',
          path: '/taxesPersonalInfoFormPage',
          builder: (context, params) => TaxesPersonalInfoFormPageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'AddTaxesPage',
          path: '/addTaxesPage',
          builder: (context, params) => const AddTaxesPageWidget(),
        ),
        FFRoute(
          name: 'TaxesPlanDetailsPage',
          path: '/taxesPlanDetailsPage',
          builder: (context, params) => TaxesPlanDetailsPageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditTaxesPage',
          path: '/editTaxesPage',
          builder: (context, params) => EditTaxesPageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'EditTaxesIncomePage',
          path: '/editTaxesIncomePage',
          builder: (context, params) => EditTaxesIncomePageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TaxesDeductionDetailPage',
          path: '/taxesDeductionDetailPage',
          builder: (context, params) => TaxesDeductionDetailPageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TaxesDonateDeductFormPage',
          path: '/taxesDonateDeductFormPage',
          builder: (context, params) => TaxesDonateDeductFormPageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'TaxesInsuranceInvestmentDeductFormPage',
          path: '/taxesInsuranceInvestmentDeductFormPage',
          builder: (context, params) =>
              TaxesInsuranceInvestmentDeductFormPageWidget(
            guid: params.getParam(
              'guid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'FVCalculatorFormPage',
          path: '/fVCalculatorFormPage',
          builder: (context, params) => const FVCalculatorFormPageWidget(),
        ),
        FFRoute(
          name: 'FVCalculatorResultPage',
          path: '/fVCalculatorResultPage',
          builder: (context, params) => FVCalculatorResultPageWidget(
            resultOutput: params.getParam(
              'resultOutput',
              ParamType.DataStruct,
              isList: false,
              structBuilder: FVOutputModelStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'AddTransPage',
          path: '/addTransPage',
          builder: (context, params) => AddTransPageWidget(
            transactionType: params.getParam<TransactionType>(
              'transactionType',
              ParamType.Enum,
            ),
          ),
        ),
        FFRoute(
          name: 'EditTransPage',
          path: '/editTransPage',
          builder: (context, params) => EditTransPageWidget(
            transactionData: params.getParam(
              'transactionData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TransactionStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'AddTransTransferPage',
          path: '/addTransTransferPage',
          builder: (context, params) => const AddTransTransferPageWidget(),
        ),
        FFRoute(
          name: 'EditTransTransferPage',
          path: '/editTransTransferPage',
          builder: (context, params) => EditTransTransferPageWidget(
            transactionData: params.getParam(
              'transactionData',
              ParamType.DataStruct,
              isList: false,
              structBuilder: TransactionStruct.fromSerializableMap,
            ),
          ),
        ),
        FFRoute(
          name: 'SettingPage',
          path: '/settingPage',
          builder: (context, params) => const SettingPageWidget(),
        ),
        FFRoute(
          name: 'ExportSelectPage',
          path: '/exportSelectPage',
          builder: (context, params) => const ExportSelectPageWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
