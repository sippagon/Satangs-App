// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalMonthSavingDataTableStruct extends BaseStruct {
  GoalMonthSavingDataTableStruct({
    int? month,
    double? income,
    double? expense,
    double? savings,
    double? balance,
    bool? reachTargetOnThisMonth,
  })  : _month = month,
        _income = income,
        _expense = expense,
        _savings = savings,
        _balance = balance,
        _reachTargetOnThisMonth = reachTargetOnThisMonth;

  // "month" field.
  int? _month;
  int get month => _month ?? 0;
  set month(int? val) => _month = val;

  void incrementMonth(int amount) => month = month + amount;

  bool hasMonth() => _month != null;

  // "income" field.
  double? _income;
  double get income => _income ?? 0.0;
  set income(double? val) => _income = val;

  void incrementIncome(double amount) => income = income + amount;

  bool hasIncome() => _income != null;

  // "expense" field.
  double? _expense;
  double get expense => _expense ?? 0.0;
  set expense(double? val) => _expense = val;

  void incrementExpense(double amount) => expense = expense + amount;

  bool hasExpense() => _expense != null;

  // "savings" field.
  double? _savings;
  double get savings => _savings ?? 0.0;
  set savings(double? val) => _savings = val;

  void incrementSavings(double amount) => savings = savings + amount;

  bool hasSavings() => _savings != null;

  // "balance" field.
  double? _balance;
  double get balance => _balance ?? 0.0;
  set balance(double? val) => _balance = val;

  void incrementBalance(double amount) => balance = balance + amount;

  bool hasBalance() => _balance != null;

  // "reachTargetOnThisMonth" field.
  bool? _reachTargetOnThisMonth;
  bool get reachTargetOnThisMonth => _reachTargetOnThisMonth ?? false;
  set reachTargetOnThisMonth(bool? val) => _reachTargetOnThisMonth = val;

  bool hasReachTargetOnThisMonth() => _reachTargetOnThisMonth != null;

  static GoalMonthSavingDataTableStruct fromMap(Map<String, dynamic> data) =>
      GoalMonthSavingDataTableStruct(
        month: castToType<int>(data['month']),
        income: castToType<double>(data['income']),
        expense: castToType<double>(data['expense']),
        savings: castToType<double>(data['savings']),
        balance: castToType<double>(data['balance']),
        reachTargetOnThisMonth: data['reachTargetOnThisMonth'] as bool?,
      );

  static GoalMonthSavingDataTableStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? GoalMonthSavingDataTableStruct.fromMap(data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'income': _income,
        'expense': _expense,
        'savings': _savings,
        'balance': _balance,
        'reachTargetOnThisMonth': _reachTargetOnThisMonth,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.int,
        ),
        'income': serializeParam(
          _income,
          ParamType.double,
        ),
        'expense': serializeParam(
          _expense,
          ParamType.double,
        ),
        'savings': serializeParam(
          _savings,
          ParamType.double,
        ),
        'balance': serializeParam(
          _balance,
          ParamType.double,
        ),
        'reachTargetOnThisMonth': serializeParam(
          _reachTargetOnThisMonth,
          ParamType.bool,
        ),
      }.withoutNulls;

  static GoalMonthSavingDataTableStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoalMonthSavingDataTableStruct(
        month: deserializeParam(
          data['month'],
          ParamType.int,
          false,
        ),
        income: deserializeParam(
          data['income'],
          ParamType.double,
          false,
        ),
        expense: deserializeParam(
          data['expense'],
          ParamType.double,
          false,
        ),
        savings: deserializeParam(
          data['savings'],
          ParamType.double,
          false,
        ),
        balance: deserializeParam(
          data['balance'],
          ParamType.double,
          false,
        ),
        reachTargetOnThisMonth: deserializeParam(
          data['reachTargetOnThisMonth'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'GoalMonthSavingDataTableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoalMonthSavingDataTableStruct &&
        month == other.month &&
        income == other.income &&
        expense == other.expense &&
        savings == other.savings &&
        balance == other.balance &&
        reachTargetOnThisMonth == other.reachTargetOnThisMonth;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([month, income, expense, savings, balance, reachTargetOnThisMonth]);
}

GoalMonthSavingDataTableStruct createGoalMonthSavingDataTableStruct({
  int? month,
  double? income,
  double? expense,
  double? savings,
  double? balance,
  bool? reachTargetOnThisMonth,
}) =>
    GoalMonthSavingDataTableStruct(
      month: month,
      income: income,
      expense: expense,
      savings: savings,
      balance: balance,
      reachTargetOnThisMonth: reachTargetOnThisMonth,
    );
