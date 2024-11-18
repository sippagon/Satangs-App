// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WealthLineChartDataStruct extends BaseStruct {
  WealthLineChartDataStruct({
    String? ageDisplay,
    double? wealthYouShouldHave,
    double? wealthYouHave,
  })  : _ageDisplay = ageDisplay,
        _wealthYouShouldHave = wealthYouShouldHave,
        _wealthYouHave = wealthYouHave;

  // "ageDisplay" field.
  String? _ageDisplay;
  String get ageDisplay => _ageDisplay ?? '';
  set ageDisplay(String? val) => _ageDisplay = val;

  bool hasAgeDisplay() => _ageDisplay != null;

  // "wealthYouShouldHave" field.
  double? _wealthYouShouldHave;
  double get wealthYouShouldHave => _wealthYouShouldHave ?? 0.0;
  set wealthYouShouldHave(double? val) => _wealthYouShouldHave = val;

  void incrementWealthYouShouldHave(double amount) =>
      wealthYouShouldHave = wealthYouShouldHave + amount;

  bool hasWealthYouShouldHave() => _wealthYouShouldHave != null;

  // "wealthYouHave" field.
  double? _wealthYouHave;
  double get wealthYouHave => _wealthYouHave ?? 0.0;
  set wealthYouHave(double? val) => _wealthYouHave = val;

  void incrementWealthYouHave(double amount) =>
      wealthYouHave = wealthYouHave + amount;

  bool hasWealthYouHave() => _wealthYouHave != null;

  static WealthLineChartDataStruct fromMap(Map<String, dynamic> data) =>
      WealthLineChartDataStruct(
        ageDisplay: data['ageDisplay'] as String?,
        wealthYouShouldHave: castToType<double>(data['wealthYouShouldHave']),
        wealthYouHave: castToType<double>(data['wealthYouHave']),
      );

  static WealthLineChartDataStruct? maybeFromMap(dynamic data) => data is Map
      ? WealthLineChartDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ageDisplay': _ageDisplay,
        'wealthYouShouldHave': _wealthYouShouldHave,
        'wealthYouHave': _wealthYouHave,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ageDisplay': serializeParam(
          _ageDisplay,
          ParamType.String,
        ),
        'wealthYouShouldHave': serializeParam(
          _wealthYouShouldHave,
          ParamType.double,
        ),
        'wealthYouHave': serializeParam(
          _wealthYouHave,
          ParamType.double,
        ),
      }.withoutNulls;

  static WealthLineChartDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WealthLineChartDataStruct(
        ageDisplay: deserializeParam(
          data['ageDisplay'],
          ParamType.String,
          false,
        ),
        wealthYouShouldHave: deserializeParam(
          data['wealthYouShouldHave'],
          ParamType.double,
          false,
        ),
        wealthYouHave: deserializeParam(
          data['wealthYouHave'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WealthLineChartDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WealthLineChartDataStruct &&
        ageDisplay == other.ageDisplay &&
        wealthYouShouldHave == other.wealthYouShouldHave &&
        wealthYouHave == other.wealthYouHave;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([ageDisplay, wealthYouShouldHave, wealthYouHave]);
}

WealthLineChartDataStruct createWealthLineChartDataStruct({
  String? ageDisplay,
  double? wealthYouShouldHave,
  double? wealthYouHave,
}) =>
    WealthLineChartDataStruct(
      ageDisplay: ageDisplay,
      wealthYouShouldHave: wealthYouShouldHave,
      wealthYouHave: wealthYouHave,
    );
