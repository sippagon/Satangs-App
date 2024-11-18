// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalChangeOfSuccessStruct extends BaseStruct {
  GoalChangeOfSuccessStruct({
    bool? possibleSuccess,
    bool? overTheTarget,
    double? totalSavings,
    double? targetAmount,
    double? needMoreAmount,
  })  : _possibleSuccess = possibleSuccess,
        _overTheTarget = overTheTarget,
        _totalSavings = totalSavings,
        _targetAmount = targetAmount,
        _needMoreAmount = needMoreAmount;

  // "possibleSuccess" field.
  bool? _possibleSuccess;
  bool get possibleSuccess => _possibleSuccess ?? false;
  set possibleSuccess(bool? val) => _possibleSuccess = val;

  bool hasPossibleSuccess() => _possibleSuccess != null;

  // "overTheTarget" field.
  bool? _overTheTarget;
  bool get overTheTarget => _overTheTarget ?? false;
  set overTheTarget(bool? val) => _overTheTarget = val;

  bool hasOverTheTarget() => _overTheTarget != null;

  // "totalSavings" field.
  double? _totalSavings;
  double get totalSavings => _totalSavings ?? 0.0;
  set totalSavings(double? val) => _totalSavings = val;

  void incrementTotalSavings(double amount) =>
      totalSavings = totalSavings + amount;

  bool hasTotalSavings() => _totalSavings != null;

  // "targetAmount" field.
  double? _targetAmount;
  double get targetAmount => _targetAmount ?? 0.0;
  set targetAmount(double? val) => _targetAmount = val;

  void incrementTargetAmount(double amount) =>
      targetAmount = targetAmount + amount;

  bool hasTargetAmount() => _targetAmount != null;

  // "needMoreAmount" field.
  double? _needMoreAmount;
  double get needMoreAmount => _needMoreAmount ?? 0.0;
  set needMoreAmount(double? val) => _needMoreAmount = val;

  void incrementNeedMoreAmount(double amount) =>
      needMoreAmount = needMoreAmount + amount;

  bool hasNeedMoreAmount() => _needMoreAmount != null;

  static GoalChangeOfSuccessStruct fromMap(Map<String, dynamic> data) =>
      GoalChangeOfSuccessStruct(
        possibleSuccess: data['possibleSuccess'] as bool?,
        overTheTarget: data['overTheTarget'] as bool?,
        totalSavings: castToType<double>(data['totalSavings']),
        targetAmount: castToType<double>(data['targetAmount']),
        needMoreAmount: castToType<double>(data['needMoreAmount']),
      );

  static GoalChangeOfSuccessStruct? maybeFromMap(dynamic data) => data is Map
      ? GoalChangeOfSuccessStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'possibleSuccess': _possibleSuccess,
        'overTheTarget': _overTheTarget,
        'totalSavings': _totalSavings,
        'targetAmount': _targetAmount,
        'needMoreAmount': _needMoreAmount,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'possibleSuccess': serializeParam(
          _possibleSuccess,
          ParamType.bool,
        ),
        'overTheTarget': serializeParam(
          _overTheTarget,
          ParamType.bool,
        ),
        'totalSavings': serializeParam(
          _totalSavings,
          ParamType.double,
        ),
        'targetAmount': serializeParam(
          _targetAmount,
          ParamType.double,
        ),
        'needMoreAmount': serializeParam(
          _needMoreAmount,
          ParamType.double,
        ),
      }.withoutNulls;

  static GoalChangeOfSuccessStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      GoalChangeOfSuccessStruct(
        possibleSuccess: deserializeParam(
          data['possibleSuccess'],
          ParamType.bool,
          false,
        ),
        overTheTarget: deserializeParam(
          data['overTheTarget'],
          ParamType.bool,
          false,
        ),
        totalSavings: deserializeParam(
          data['totalSavings'],
          ParamType.double,
          false,
        ),
        targetAmount: deserializeParam(
          data['targetAmount'],
          ParamType.double,
          false,
        ),
        needMoreAmount: deserializeParam(
          data['needMoreAmount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'GoalChangeOfSuccessStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoalChangeOfSuccessStruct &&
        possibleSuccess == other.possibleSuccess &&
        overTheTarget == other.overTheTarget &&
        totalSavings == other.totalSavings &&
        targetAmount == other.targetAmount &&
        needMoreAmount == other.needMoreAmount;
  }

  @override
  int get hashCode => const ListEquality().hash([
        possibleSuccess,
        overTheTarget,
        totalSavings,
        targetAmount,
        needMoreAmount
      ]);
}

GoalChangeOfSuccessStruct createGoalChangeOfSuccessStruct({
  bool? possibleSuccess,
  bool? overTheTarget,
  double? totalSavings,
  double? targetAmount,
  double? needMoreAmount,
}) =>
    GoalChangeOfSuccessStruct(
      possibleSuccess: possibleSuccess,
      overTheTarget: overTheTarget,
      totalSavings: totalSavings,
      targetAmount: targetAmount,
      needMoreAmount: needMoreAmount,
    );
