// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BarChartMonthlyTransactionsStruct extends BaseStruct {
  BarChartMonthlyTransactionsStruct({
    DateTime? month,
    double? totalIncome,
    double? totalExpense,
  })  : _month = month,
        _totalIncome = totalIncome,
        _totalExpense = totalExpense;

  // "month" field.
  DateTime? _month;
  DateTime? get month => _month;
  set month(DateTime? val) => _month = val;

  bool hasMonth() => _month != null;

  // "totalIncome" field.
  double? _totalIncome;
  double get totalIncome => _totalIncome ?? 0.0;
  set totalIncome(double? val) => _totalIncome = val;

  void incrementTotalIncome(double amount) =>
      totalIncome = totalIncome + amount;

  bool hasTotalIncome() => _totalIncome != null;

  // "totalExpense" field.
  double? _totalExpense;
  double get totalExpense => _totalExpense ?? 0.0;
  set totalExpense(double? val) => _totalExpense = val;

  void incrementTotalExpense(double amount) =>
      totalExpense = totalExpense + amount;

  bool hasTotalExpense() => _totalExpense != null;

  static BarChartMonthlyTransactionsStruct fromMap(Map<String, dynamic> data) =>
      BarChartMonthlyTransactionsStruct(
        month: data['month'] as DateTime?,
        totalIncome: castToType<double>(data['totalIncome']),
        totalExpense: castToType<double>(data['totalExpense']),
      );

  static BarChartMonthlyTransactionsStruct? maybeFromMap(dynamic data) => data
          is Map
      ? BarChartMonthlyTransactionsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'month': _month,
        'totalIncome': _totalIncome,
        'totalExpense': _totalExpense,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'month': serializeParam(
          _month,
          ParamType.DateTime,
        ),
        'totalIncome': serializeParam(
          _totalIncome,
          ParamType.double,
        ),
        'totalExpense': serializeParam(
          _totalExpense,
          ParamType.double,
        ),
      }.withoutNulls;

  static BarChartMonthlyTransactionsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BarChartMonthlyTransactionsStruct(
        month: deserializeParam(
          data['month'],
          ParamType.DateTime,
          false,
        ),
        totalIncome: deserializeParam(
          data['totalIncome'],
          ParamType.double,
          false,
        ),
        totalExpense: deserializeParam(
          data['totalExpense'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BarChartMonthlyTransactionsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BarChartMonthlyTransactionsStruct &&
        month == other.month &&
        totalIncome == other.totalIncome &&
        totalExpense == other.totalExpense;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([month, totalIncome, totalExpense]);
}

BarChartMonthlyTransactionsStruct createBarChartMonthlyTransactionsStruct({
  DateTime? month,
  double? totalIncome,
  double? totalExpense,
}) =>
    BarChartMonthlyTransactionsStruct(
      month: month,
      totalIncome: totalIncome,
      totalExpense: totalExpense,
    );
