// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WealthInfoStruct extends BaseStruct {
  WealthInfoStruct({
    double? totalAssets,
    double? totalDebt,
    double? yearlyIncome,
  })  : _totalAssets = totalAssets,
        _totalDebt = totalDebt,
        _yearlyIncome = yearlyIncome;

  // "totalAssets" field.
  double? _totalAssets;
  double get totalAssets => _totalAssets ?? 0.0;
  set totalAssets(double? val) => _totalAssets = val;

  void incrementTotalAssets(double amount) =>
      totalAssets = totalAssets + amount;

  bool hasTotalAssets() => _totalAssets != null;

  // "totalDebt" field.
  double? _totalDebt;
  double get totalDebt => _totalDebt ?? 0.0;
  set totalDebt(double? val) => _totalDebt = val;

  void incrementTotalDebt(double amount) => totalDebt = totalDebt + amount;

  bool hasTotalDebt() => _totalDebt != null;

  // "yearlyIncome" field.
  double? _yearlyIncome;
  double get yearlyIncome => _yearlyIncome ?? 0.0;
  set yearlyIncome(double? val) => _yearlyIncome = val;

  void incrementYearlyIncome(double amount) =>
      yearlyIncome = yearlyIncome + amount;

  bool hasYearlyIncome() => _yearlyIncome != null;

  static WealthInfoStruct fromMap(Map<String, dynamic> data) =>
      WealthInfoStruct(
        totalAssets: castToType<double>(data['totalAssets']),
        totalDebt: castToType<double>(data['totalDebt']),
        yearlyIncome: castToType<double>(data['yearlyIncome']),
      );

  static WealthInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? WealthInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'totalAssets': _totalAssets,
        'totalDebt': _totalDebt,
        'yearlyIncome': _yearlyIncome,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalAssets': serializeParam(
          _totalAssets,
          ParamType.double,
        ),
        'totalDebt': serializeParam(
          _totalDebt,
          ParamType.double,
        ),
        'yearlyIncome': serializeParam(
          _yearlyIncome,
          ParamType.double,
        ),
      }.withoutNulls;

  static WealthInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      WealthInfoStruct(
        totalAssets: deserializeParam(
          data['totalAssets'],
          ParamType.double,
          false,
        ),
        totalDebt: deserializeParam(
          data['totalDebt'],
          ParamType.double,
          false,
        ),
        yearlyIncome: deserializeParam(
          data['yearlyIncome'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WealthInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WealthInfoStruct &&
        totalAssets == other.totalAssets &&
        totalDebt == other.totalDebt &&
        yearlyIncome == other.yearlyIncome;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([totalAssets, totalDebt, yearlyIncome]);
}

WealthInfoStruct createWealthInfoStruct({
  double? totalAssets,
  double? totalDebt,
  double? yearlyIncome,
}) =>
    WealthInfoStruct(
      totalAssets: totalAssets,
      totalDebt: totalDebt,
      yearlyIncome: yearlyIncome,
    );
