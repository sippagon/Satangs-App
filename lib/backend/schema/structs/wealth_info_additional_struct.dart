// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WealthInfoAdditionalStruct extends BaseStruct {
  WealthInfoAdditionalStruct({
    double? incomeGrowthRate,
    double? inflationRate,
    double? yearlyExpenses,
    double? assetsGrowthRate,
  })  : _incomeGrowthRate = incomeGrowthRate,
        _inflationRate = inflationRate,
        _yearlyExpenses = yearlyExpenses,
        _assetsGrowthRate = assetsGrowthRate;

  // "incomeGrowthRate" field.
  double? _incomeGrowthRate;
  double get incomeGrowthRate => _incomeGrowthRate ?? 0.0;
  set incomeGrowthRate(double? val) => _incomeGrowthRate = val;

  void incrementIncomeGrowthRate(double amount) =>
      incomeGrowthRate = incomeGrowthRate + amount;

  bool hasIncomeGrowthRate() => _incomeGrowthRate != null;

  // "inflationRate" field.
  double? _inflationRate;
  double get inflationRate => _inflationRate ?? 0.0;
  set inflationRate(double? val) => _inflationRate = val;

  void incrementInflationRate(double amount) =>
      inflationRate = inflationRate + amount;

  bool hasInflationRate() => _inflationRate != null;

  // "yearlyExpenses" field.
  double? _yearlyExpenses;
  double get yearlyExpenses => _yearlyExpenses ?? 0.0;
  set yearlyExpenses(double? val) => _yearlyExpenses = val;

  void incrementYearlyExpenses(double amount) =>
      yearlyExpenses = yearlyExpenses + amount;

  bool hasYearlyExpenses() => _yearlyExpenses != null;

  // "assetsGrowthRate" field.
  double? _assetsGrowthRate;
  double get assetsGrowthRate => _assetsGrowthRate ?? 0.0;
  set assetsGrowthRate(double? val) => _assetsGrowthRate = val;

  void incrementAssetsGrowthRate(double amount) =>
      assetsGrowthRate = assetsGrowthRate + amount;

  bool hasAssetsGrowthRate() => _assetsGrowthRate != null;

  static WealthInfoAdditionalStruct fromMap(Map<String, dynamic> data) =>
      WealthInfoAdditionalStruct(
        incomeGrowthRate: castToType<double>(data['incomeGrowthRate']),
        inflationRate: castToType<double>(data['inflationRate']),
        yearlyExpenses: castToType<double>(data['yearlyExpenses']),
        assetsGrowthRate: castToType<double>(data['assetsGrowthRate']),
      );

  static WealthInfoAdditionalStruct? maybeFromMap(dynamic data) => data is Map
      ? WealthInfoAdditionalStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'incomeGrowthRate': _incomeGrowthRate,
        'inflationRate': _inflationRate,
        'yearlyExpenses': _yearlyExpenses,
        'assetsGrowthRate': _assetsGrowthRate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'incomeGrowthRate': serializeParam(
          _incomeGrowthRate,
          ParamType.double,
        ),
        'inflationRate': serializeParam(
          _inflationRate,
          ParamType.double,
        ),
        'yearlyExpenses': serializeParam(
          _yearlyExpenses,
          ParamType.double,
        ),
        'assetsGrowthRate': serializeParam(
          _assetsGrowthRate,
          ParamType.double,
        ),
      }.withoutNulls;

  static WealthInfoAdditionalStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WealthInfoAdditionalStruct(
        incomeGrowthRate: deserializeParam(
          data['incomeGrowthRate'],
          ParamType.double,
          false,
        ),
        inflationRate: deserializeParam(
          data['inflationRate'],
          ParamType.double,
          false,
        ),
        yearlyExpenses: deserializeParam(
          data['yearlyExpenses'],
          ParamType.double,
          false,
        ),
        assetsGrowthRate: deserializeParam(
          data['assetsGrowthRate'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WealthInfoAdditionalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WealthInfoAdditionalStruct &&
        incomeGrowthRate == other.incomeGrowthRate &&
        inflationRate == other.inflationRate &&
        yearlyExpenses == other.yearlyExpenses &&
        assetsGrowthRate == other.assetsGrowthRate;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [incomeGrowthRate, inflationRate, yearlyExpenses, assetsGrowthRate]);
}

WealthInfoAdditionalStruct createWealthInfoAdditionalStruct({
  double? incomeGrowthRate,
  double? inflationRate,
  double? yearlyExpenses,
  double? assetsGrowthRate,
}) =>
    WealthInfoAdditionalStruct(
      incomeGrowthRate: incomeGrowthRate,
      inflationRate: inflationRate,
      yearlyExpenses: yearlyExpenses,
      assetsGrowthRate: assetsGrowthRate,
    );
