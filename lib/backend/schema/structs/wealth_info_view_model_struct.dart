// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WealthInfoViewModelStruct extends BaseStruct {
  WealthInfoViewModelStruct({
    int? userAge,
    double? netWealth,
    double? netWealthYouShouldHave,
    double? wealthRatio,
  })  : _userAge = userAge,
        _netWealth = netWealth,
        _netWealthYouShouldHave = netWealthYouShouldHave,
        _wealthRatio = wealthRatio;

  // "UserAge" field.
  int? _userAge;
  int get userAge => _userAge ?? 0;
  set userAge(int? val) => _userAge = val;

  void incrementUserAge(int amount) => userAge = userAge + amount;

  bool hasUserAge() => _userAge != null;

  // "NetWealth" field.
  double? _netWealth;
  double get netWealth => _netWealth ?? 0.0;
  set netWealth(double? val) => _netWealth = val;

  void incrementNetWealth(double amount) => netWealth = netWealth + amount;

  bool hasNetWealth() => _netWealth != null;

  // "NetWealthYouShouldHave" field.
  double? _netWealthYouShouldHave;
  double get netWealthYouShouldHave => _netWealthYouShouldHave ?? 0.0;
  set netWealthYouShouldHave(double? val) => _netWealthYouShouldHave = val;

  void incrementNetWealthYouShouldHave(double amount) =>
      netWealthYouShouldHave = netWealthYouShouldHave + amount;

  bool hasNetWealthYouShouldHave() => _netWealthYouShouldHave != null;

  // "WealthRatio" field.
  double? _wealthRatio;
  double get wealthRatio => _wealthRatio ?? 0.0;
  set wealthRatio(double? val) => _wealthRatio = val;

  void incrementWealthRatio(double amount) =>
      wealthRatio = wealthRatio + amount;

  bool hasWealthRatio() => _wealthRatio != null;

  static WealthInfoViewModelStruct fromMap(Map<String, dynamic> data) =>
      WealthInfoViewModelStruct(
        userAge: castToType<int>(data['UserAge']),
        netWealth: castToType<double>(data['NetWealth']),
        netWealthYouShouldHave:
            castToType<double>(data['NetWealthYouShouldHave']),
        wealthRatio: castToType<double>(data['WealthRatio']),
      );

  static WealthInfoViewModelStruct? maybeFromMap(dynamic data) => data is Map
      ? WealthInfoViewModelStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'UserAge': _userAge,
        'NetWealth': _netWealth,
        'NetWealthYouShouldHave': _netWealthYouShouldHave,
        'WealthRatio': _wealthRatio,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserAge': serializeParam(
          _userAge,
          ParamType.int,
        ),
        'NetWealth': serializeParam(
          _netWealth,
          ParamType.double,
        ),
        'NetWealthYouShouldHave': serializeParam(
          _netWealthYouShouldHave,
          ParamType.double,
        ),
        'WealthRatio': serializeParam(
          _wealthRatio,
          ParamType.double,
        ),
      }.withoutNulls;

  static WealthInfoViewModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      WealthInfoViewModelStruct(
        userAge: deserializeParam(
          data['UserAge'],
          ParamType.int,
          false,
        ),
        netWealth: deserializeParam(
          data['NetWealth'],
          ParamType.double,
          false,
        ),
        netWealthYouShouldHave: deserializeParam(
          data['NetWealthYouShouldHave'],
          ParamType.double,
          false,
        ),
        wealthRatio: deserializeParam(
          data['WealthRatio'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'WealthInfoViewModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WealthInfoViewModelStruct &&
        userAge == other.userAge &&
        netWealth == other.netWealth &&
        netWealthYouShouldHave == other.netWealthYouShouldHave &&
        wealthRatio == other.wealthRatio;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userAge, netWealth, netWealthYouShouldHave, wealthRatio]);
}

WealthInfoViewModelStruct createWealthInfoViewModelStruct({
  int? userAge,
  double? netWealth,
  double? netWealthYouShouldHave,
  double? wealthRatio,
}) =>
    WealthInfoViewModelStruct(
      userAge: userAge,
      netWealth: netWealth,
      netWealthYouShouldHave: netWealthYouShouldHave,
      wealthRatio: wealthRatio,
    );
