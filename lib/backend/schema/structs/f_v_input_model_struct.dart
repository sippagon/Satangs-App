// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FVInputModelStruct extends BaseStruct {
  FVInputModelStruct({
    int? periods,
    double? presentValue,
    double? rate,
    double? deposits,
  })  : _periods = periods,
        _presentValue = presentValue,
        _rate = rate,
        _deposits = deposits;

  // "periods" field.
  int? _periods;
  int get periods => _periods ?? 0;
  set periods(int? val) => _periods = val;

  void incrementPeriods(int amount) => periods = periods + amount;

  bool hasPeriods() => _periods != null;

  // "presentValue" field.
  double? _presentValue;
  double get presentValue => _presentValue ?? 0.0;
  set presentValue(double? val) => _presentValue = val;

  void incrementPresentValue(double amount) =>
      presentValue = presentValue + amount;

  bool hasPresentValue() => _presentValue != null;

  // "rate" field.
  double? _rate;
  double get rate => _rate ?? 0.0;
  set rate(double? val) => _rate = val;

  void incrementRate(double amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  // "deposits" field.
  double? _deposits;
  double get deposits => _deposits ?? 0.0;
  set deposits(double? val) => _deposits = val;

  void incrementDeposits(double amount) => deposits = deposits + amount;

  bool hasDeposits() => _deposits != null;

  static FVInputModelStruct fromMap(Map<String, dynamic> data) =>
      FVInputModelStruct(
        periods: castToType<int>(data['periods']),
        presentValue: castToType<double>(data['presentValue']),
        rate: castToType<double>(data['rate']),
        deposits: castToType<double>(data['deposits']),
      );

  static FVInputModelStruct? maybeFromMap(dynamic data) => data is Map
      ? FVInputModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'periods': _periods,
        'presentValue': _presentValue,
        'rate': _rate,
        'deposits': _deposits,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'periods': serializeParam(
          _periods,
          ParamType.int,
        ),
        'presentValue': serializeParam(
          _presentValue,
          ParamType.double,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.double,
        ),
        'deposits': serializeParam(
          _deposits,
          ParamType.double,
        ),
      }.withoutNulls;

  static FVInputModelStruct fromSerializableMap(Map<String, dynamic> data) =>
      FVInputModelStruct(
        periods: deserializeParam(
          data['periods'],
          ParamType.int,
          false,
        ),
        presentValue: deserializeParam(
          data['presentValue'],
          ParamType.double,
          false,
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.double,
          false,
        ),
        deposits: deserializeParam(
          data['deposits'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'FVInputModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FVInputModelStruct &&
        periods == other.periods &&
        presentValue == other.presentValue &&
        rate == other.rate &&
        deposits == other.deposits;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([periods, presentValue, rate, deposits]);
}

FVInputModelStruct createFVInputModelStruct({
  int? periods,
  double? presentValue,
  double? rate,
  double? deposits,
}) =>
    FVInputModelStruct(
      periods: periods,
      presentValue: presentValue,
      rate: rate,
      deposits: deposits,
    );
