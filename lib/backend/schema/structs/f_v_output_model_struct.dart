// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FVOutputModelStruct extends BaseStruct {
  FVOutputModelStruct({
    double? resultFv,
    double? totalPresentValue,
    double? totalIntereset,
    double? totalDeposit,
  })  : _resultFv = resultFv,
        _totalPresentValue = totalPresentValue,
        _totalIntereset = totalIntereset,
        _totalDeposit = totalDeposit;

  // "resultFv" field.
  double? _resultFv;
  double get resultFv => _resultFv ?? 0.0;
  set resultFv(double? val) => _resultFv = val;

  void incrementResultFv(double amount) => resultFv = resultFv + amount;

  bool hasResultFv() => _resultFv != null;

  // "totalPresentValue" field.
  double? _totalPresentValue;
  double get totalPresentValue => _totalPresentValue ?? 0.0;
  set totalPresentValue(double? val) => _totalPresentValue = val;

  void incrementTotalPresentValue(double amount) =>
      totalPresentValue = totalPresentValue + amount;

  bool hasTotalPresentValue() => _totalPresentValue != null;

  // "totalIntereset" field.
  double? _totalIntereset;
  double get totalIntereset => _totalIntereset ?? 0.0;
  set totalIntereset(double? val) => _totalIntereset = val;

  void incrementTotalIntereset(double amount) =>
      totalIntereset = totalIntereset + amount;

  bool hasTotalIntereset() => _totalIntereset != null;

  // "totalDeposit" field.
  double? _totalDeposit;
  double get totalDeposit => _totalDeposit ?? 0.0;
  set totalDeposit(double? val) => _totalDeposit = val;

  void incrementTotalDeposit(double amount) =>
      totalDeposit = totalDeposit + amount;

  bool hasTotalDeposit() => _totalDeposit != null;

  static FVOutputModelStruct fromMap(Map<String, dynamic> data) =>
      FVOutputModelStruct(
        resultFv: castToType<double>(data['resultFv']),
        totalPresentValue: castToType<double>(data['totalPresentValue']),
        totalIntereset: castToType<double>(data['totalIntereset']),
        totalDeposit: castToType<double>(data['totalDeposit']),
      );

  static FVOutputModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FVOutputModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'resultFv': _resultFv,
        'totalPresentValue': _totalPresentValue,
        'totalIntereset': _totalIntereset,
        'totalDeposit': _totalDeposit,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'resultFv': serializeParam(
          _resultFv,
          ParamType.double,
        ),
        'totalPresentValue': serializeParam(
          _totalPresentValue,
          ParamType.double,
        ),
        'totalIntereset': serializeParam(
          _totalIntereset,
          ParamType.double,
        ),
        'totalDeposit': serializeParam(
          _totalDeposit,
          ParamType.double,
        ),
      }.withoutNulls;

  static FVOutputModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FVOutputModelStruct(
        resultFv: deserializeParam(
          data['resultFv'],
          ParamType.double,
          false,
        ),
        totalPresentValue: deserializeParam(
          data['totalPresentValue'],
          ParamType.double,
          false,
        ),
        totalIntereset: deserializeParam(
          data['totalIntereset'],
          ParamType.double,
          false,
        ),
        totalDeposit: deserializeParam(
          data['totalDeposit'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'FVOutputModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FVOutputModelStruct &&
        resultFv == other.resultFv &&
        totalPresentValue == other.totalPresentValue &&
        totalIntereset == other.totalIntereset &&
        totalDeposit == other.totalDeposit;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([resultFv, totalPresentValue, totalIntereset, totalDeposit]);
}

FVOutputModelStruct createFVOutputModelStruct({
  double? resultFv,
  double? totalPresentValue,
  double? totalIntereset,
  double? totalDeposit,
}) =>
    FVOutputModelStruct(
      resultFv: resultFv,
      totalPresentValue: totalPresentValue,
      totalIntereset: totalIntereset,
      totalDeposit: totalDeposit,
    );
