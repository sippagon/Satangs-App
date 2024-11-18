// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WealthCalculateResultModelStruct extends BaseStruct {
  WealthCalculateResultModelStruct({
    double? wealthShouldHave,
    double? wealthNeeded,
    double? monthlySavings,
    double? interestGrowthRate,
  })  : _wealthShouldHave = wealthShouldHave,
        _wealthNeeded = wealthNeeded,
        _monthlySavings = monthlySavings,
        _interestGrowthRate = interestGrowthRate;

  // "wealthShouldHave" field.
  double? _wealthShouldHave;
  double get wealthShouldHave => _wealthShouldHave ?? 0.0;
  set wealthShouldHave(double? val) => _wealthShouldHave = val;

  void incrementWealthShouldHave(double amount) =>
      wealthShouldHave = wealthShouldHave + amount;

  bool hasWealthShouldHave() => _wealthShouldHave != null;

  // "wealthNeeded" field.
  double? _wealthNeeded;
  double get wealthNeeded => _wealthNeeded ?? 0.0;
  set wealthNeeded(double? val) => _wealthNeeded = val;

  void incrementWealthNeeded(double amount) =>
      wealthNeeded = wealthNeeded + amount;

  bool hasWealthNeeded() => _wealthNeeded != null;

  // "monthlySavings" field.
  double? _monthlySavings;
  double get monthlySavings => _monthlySavings ?? 0.0;
  set monthlySavings(double? val) => _monthlySavings = val;

  void incrementMonthlySavings(double amount) =>
      monthlySavings = monthlySavings + amount;

  bool hasMonthlySavings() => _monthlySavings != null;

  // "interestGrowthRate" field.
  double? _interestGrowthRate;
  double get interestGrowthRate => _interestGrowthRate ?? 0.0;
  set interestGrowthRate(double? val) => _interestGrowthRate = val;

  void incrementInterestGrowthRate(double amount) =>
      interestGrowthRate = interestGrowthRate + amount;

  bool hasInterestGrowthRate() => _interestGrowthRate != null;

  static WealthCalculateResultModelStruct fromMap(Map<String, dynamic> data) =>
      WealthCalculateResultModelStruct(
        wealthShouldHave: castToType<double>(data['wealthShouldHave']),
        wealthNeeded: castToType<double>(data['wealthNeeded']),
        monthlySavings: castToType<double>(data['monthlySavings']),
        interestGrowthRate: castToType<double>(data['interestGrowthRate']),
      );

  static WealthCalculateResultModelStruct? maybeFromMap(dynamic data) => data
          is Map
      ? WealthCalculateResultModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'wealthShouldHave': _wealthShouldHave,
        'wealthNeeded': _wealthNeeded,
        'monthlySavings': _monthlySavings,
        'interestGrowthRate': _interestGrowthRate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'wealthShouldHave': serializeParam(
          _wealthShouldHave,
          ParamType.double,
        ),
        'wealthNeeded': serializeParam(
          _wealthNeeded,
          ParamType.double,
        ),
        'monthlySavings': serializeParam(
          _monthlySavings,
          ParamType.double,
        ),
        'interestGrowthRate': serializeParam(
          _interestGrowthRate,
          ParamType.double,
        ),
      }.withoutNulls;

  static WealthCalculateResultModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WealthCalculateResultModelStruct(
        wealthShouldHave: deserializeParam(
          data['wealthShouldHave'],
          ParamType.double,
          false,
        ),
        wealthNeeded: deserializeParam(
          data['wealthNeeded'],
          ParamType.double,
          false,
        ),
        monthlySavings: deserializeParam(
          data['monthlySavings'],
          ParamType.double,
          false,
        ),
        interestGrowthRate: deserializeParam(
          data['interestGrowthRate'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WealthCalculateResultModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WealthCalculateResultModelStruct &&
        wealthShouldHave == other.wealthShouldHave &&
        wealthNeeded == other.wealthNeeded &&
        monthlySavings == other.monthlySavings &&
        interestGrowthRate == other.interestGrowthRate;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [wealthShouldHave, wealthNeeded, monthlySavings, interestGrowthRate]);
}

WealthCalculateResultModelStruct createWealthCalculateResultModelStruct({
  double? wealthShouldHave,
  double? wealthNeeded,
  double? monthlySavings,
  double? interestGrowthRate,
}) =>
    WealthCalculateResultModelStruct(
      wealthShouldHave: wealthShouldHave,
      wealthNeeded: wealthNeeded,
      monthlySavings: monthlySavings,
      interestGrowthRate: interestGrowthRate,
    );
