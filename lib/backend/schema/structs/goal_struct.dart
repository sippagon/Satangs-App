// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GoalStruct extends BaseStruct {
  GoalStruct({
    String? guid,
    String? name,
    double? targetAmount,
    double? currentBalance,
    DateTime? targetDate,
    double? monthlyIncome,
    double? monthlyExpense,
    double? savingInterestRate,
    double? incomeGrowthRate,
    double? progressPercatage,
    double? changeOfSuccessScore,
    bool? isFinished,
    DateTime? createOnLocalTime,
    DateTime? updateOnLocalTime,
  })  : _guid = guid,
        _name = name,
        _targetAmount = targetAmount,
        _currentBalance = currentBalance,
        _targetDate = targetDate,
        _monthlyIncome = monthlyIncome,
        _monthlyExpense = monthlyExpense,
        _savingInterestRate = savingInterestRate,
        _incomeGrowthRate = incomeGrowthRate,
        _progressPercatage = progressPercatage,
        _changeOfSuccessScore = changeOfSuccessScore,
        _isFinished = isFinished,
        _createOnLocalTime = createOnLocalTime,
        _updateOnLocalTime = updateOnLocalTime;

  // "guid" field.
  String? _guid;
  String get guid => _guid ?? '';
  set guid(String? val) => _guid = val;

  bool hasGuid() => _guid != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "targetAmount" field.
  double? _targetAmount;
  double get targetAmount => _targetAmount ?? 0.0;
  set targetAmount(double? val) => _targetAmount = val;

  void incrementTargetAmount(double amount) =>
      targetAmount = targetAmount + amount;

  bool hasTargetAmount() => _targetAmount != null;

  // "currentBalance" field.
  double? _currentBalance;
  double get currentBalance => _currentBalance ?? 0.0;
  set currentBalance(double? val) => _currentBalance = val;

  void incrementCurrentBalance(double amount) =>
      currentBalance = currentBalance + amount;

  bool hasCurrentBalance() => _currentBalance != null;

  // "targetDate" field.
  DateTime? _targetDate;
  DateTime? get targetDate => _targetDate;
  set targetDate(DateTime? val) => _targetDate = val;

  bool hasTargetDate() => _targetDate != null;

  // "monthlyIncome" field.
  double? _monthlyIncome;
  double get monthlyIncome => _monthlyIncome ?? 0.0;
  set monthlyIncome(double? val) => _monthlyIncome = val;

  void incrementMonthlyIncome(double amount) =>
      monthlyIncome = monthlyIncome + amount;

  bool hasMonthlyIncome() => _monthlyIncome != null;

  // "monthlyExpense" field.
  double? _monthlyExpense;
  double get monthlyExpense => _monthlyExpense ?? 0.0;
  set monthlyExpense(double? val) => _monthlyExpense = val;

  void incrementMonthlyExpense(double amount) =>
      monthlyExpense = monthlyExpense + amount;

  bool hasMonthlyExpense() => _monthlyExpense != null;

  // "savingInterestRate" field.
  double? _savingInterestRate;
  double get savingInterestRate => _savingInterestRate ?? 0.3;
  set savingInterestRate(double? val) => _savingInterestRate = val;

  void incrementSavingInterestRate(double amount) =>
      savingInterestRate = savingInterestRate + amount;

  bool hasSavingInterestRate() => _savingInterestRate != null;

  // "incomeGrowthRate" field.
  double? _incomeGrowthRate;
  double get incomeGrowthRate => _incomeGrowthRate ?? 2.0;
  set incomeGrowthRate(double? val) => _incomeGrowthRate = val;

  void incrementIncomeGrowthRate(double amount) =>
      incomeGrowthRate = incomeGrowthRate + amount;

  bool hasIncomeGrowthRate() => _incomeGrowthRate != null;

  // "progressPercatage" field.
  double? _progressPercatage;
  double get progressPercatage => _progressPercatage ?? 0.0;
  set progressPercatage(double? val) => _progressPercatage = val;

  void incrementProgressPercatage(double amount) =>
      progressPercatage = progressPercatage + amount;

  bool hasProgressPercatage() => _progressPercatage != null;

  // "changeOfSuccessScore" field.
  double? _changeOfSuccessScore;
  double get changeOfSuccessScore => _changeOfSuccessScore ?? 0.0;
  set changeOfSuccessScore(double? val) => _changeOfSuccessScore = val;

  void incrementChangeOfSuccessScore(double amount) =>
      changeOfSuccessScore = changeOfSuccessScore + amount;

  bool hasChangeOfSuccessScore() => _changeOfSuccessScore != null;

  // "isFinished" field.
  bool? _isFinished;
  bool get isFinished => _isFinished ?? false;
  set isFinished(bool? val) => _isFinished = val;

  bool hasIsFinished() => _isFinished != null;

  // "createOnLocalTime" field.
  DateTime? _createOnLocalTime;
  DateTime? get createOnLocalTime => _createOnLocalTime;
  set createOnLocalTime(DateTime? val) => _createOnLocalTime = val;

  bool hasCreateOnLocalTime() => _createOnLocalTime != null;

  // "updateOnLocalTime" field.
  DateTime? _updateOnLocalTime;
  DateTime? get updateOnLocalTime => _updateOnLocalTime;
  set updateOnLocalTime(DateTime? val) => _updateOnLocalTime = val;

  bool hasUpdateOnLocalTime() => _updateOnLocalTime != null;

  static GoalStruct fromMap(Map<String, dynamic> data) => GoalStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        targetAmount: castToType<double>(data['targetAmount']),
        currentBalance: castToType<double>(data['currentBalance']),
        targetDate: data['targetDate'] as DateTime?,
        monthlyIncome: castToType<double>(data['monthlyIncome']),
        monthlyExpense: castToType<double>(data['monthlyExpense']),
        savingInterestRate: castToType<double>(data['savingInterestRate']),
        incomeGrowthRate: castToType<double>(data['incomeGrowthRate']),
        progressPercatage: castToType<double>(data['progressPercatage']),
        changeOfSuccessScore: castToType<double>(data['changeOfSuccessScore']),
        isFinished: data['isFinished'] as bool?,
        createOnLocalTime: data['createOnLocalTime'] as DateTime?,
        updateOnLocalTime: data['updateOnLocalTime'] as DateTime?,
      );

  static GoalStruct? maybeFromMap(dynamic data) =>
      data is Map ? GoalStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'targetAmount': _targetAmount,
        'currentBalance': _currentBalance,
        'targetDate': _targetDate,
        'monthlyIncome': _monthlyIncome,
        'monthlyExpense': _monthlyExpense,
        'savingInterestRate': _savingInterestRate,
        'incomeGrowthRate': _incomeGrowthRate,
        'progressPercatage': _progressPercatage,
        'changeOfSuccessScore': _changeOfSuccessScore,
        'isFinished': _isFinished,
        'createOnLocalTime': _createOnLocalTime,
        'updateOnLocalTime': _updateOnLocalTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'guid': serializeParam(
          _guid,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'targetAmount': serializeParam(
          _targetAmount,
          ParamType.double,
        ),
        'currentBalance': serializeParam(
          _currentBalance,
          ParamType.double,
        ),
        'targetDate': serializeParam(
          _targetDate,
          ParamType.DateTime,
        ),
        'monthlyIncome': serializeParam(
          _monthlyIncome,
          ParamType.double,
        ),
        'monthlyExpense': serializeParam(
          _monthlyExpense,
          ParamType.double,
        ),
        'savingInterestRate': serializeParam(
          _savingInterestRate,
          ParamType.double,
        ),
        'incomeGrowthRate': serializeParam(
          _incomeGrowthRate,
          ParamType.double,
        ),
        'progressPercatage': serializeParam(
          _progressPercatage,
          ParamType.double,
        ),
        'changeOfSuccessScore': serializeParam(
          _changeOfSuccessScore,
          ParamType.double,
        ),
        'isFinished': serializeParam(
          _isFinished,
          ParamType.bool,
        ),
        'createOnLocalTime': serializeParam(
          _createOnLocalTime,
          ParamType.DateTime,
        ),
        'updateOnLocalTime': serializeParam(
          _updateOnLocalTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static GoalStruct fromSerializableMap(Map<String, dynamic> data) =>
      GoalStruct(
        guid: deserializeParam(
          data['guid'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        targetAmount: deserializeParam(
          data['targetAmount'],
          ParamType.double,
          false,
        ),
        currentBalance: deserializeParam(
          data['currentBalance'],
          ParamType.double,
          false,
        ),
        targetDate: deserializeParam(
          data['targetDate'],
          ParamType.DateTime,
          false,
        ),
        monthlyIncome: deserializeParam(
          data['monthlyIncome'],
          ParamType.double,
          false,
        ),
        monthlyExpense: deserializeParam(
          data['monthlyExpense'],
          ParamType.double,
          false,
        ),
        savingInterestRate: deserializeParam(
          data['savingInterestRate'],
          ParamType.double,
          false,
        ),
        incomeGrowthRate: deserializeParam(
          data['incomeGrowthRate'],
          ParamType.double,
          false,
        ),
        progressPercatage: deserializeParam(
          data['progressPercatage'],
          ParamType.double,
          false,
        ),
        changeOfSuccessScore: deserializeParam(
          data['changeOfSuccessScore'],
          ParamType.double,
          false,
        ),
        isFinished: deserializeParam(
          data['isFinished'],
          ParamType.bool,
          false,
        ),
        createOnLocalTime: deserializeParam(
          data['createOnLocalTime'],
          ParamType.DateTime,
          false,
        ),
        updateOnLocalTime: deserializeParam(
          data['updateOnLocalTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'GoalStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GoalStruct &&
        guid == other.guid &&
        name == other.name &&
        targetAmount == other.targetAmount &&
        currentBalance == other.currentBalance &&
        targetDate == other.targetDate &&
        monthlyIncome == other.monthlyIncome &&
        monthlyExpense == other.monthlyExpense &&
        savingInterestRate == other.savingInterestRate &&
        incomeGrowthRate == other.incomeGrowthRate &&
        progressPercatage == other.progressPercatage &&
        changeOfSuccessScore == other.changeOfSuccessScore &&
        isFinished == other.isFinished &&
        createOnLocalTime == other.createOnLocalTime &&
        updateOnLocalTime == other.updateOnLocalTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        name,
        targetAmount,
        currentBalance,
        targetDate,
        monthlyIncome,
        monthlyExpense,
        savingInterestRate,
        incomeGrowthRate,
        progressPercatage,
        changeOfSuccessScore,
        isFinished,
        createOnLocalTime,
        updateOnLocalTime
      ]);
}

GoalStruct createGoalStruct({
  String? guid,
  String? name,
  double? targetAmount,
  double? currentBalance,
  DateTime? targetDate,
  double? monthlyIncome,
  double? monthlyExpense,
  double? savingInterestRate,
  double? incomeGrowthRate,
  double? progressPercatage,
  double? changeOfSuccessScore,
  bool? isFinished,
  DateTime? createOnLocalTime,
  DateTime? updateOnLocalTime,
}) =>
    GoalStruct(
      guid: guid,
      name: name,
      targetAmount: targetAmount,
      currentBalance: currentBalance,
      targetDate: targetDate,
      monthlyIncome: monthlyIncome,
      monthlyExpense: monthlyExpense,
      savingInterestRate: savingInterestRate,
      incomeGrowthRate: incomeGrowthRate,
      progressPercatage: progressPercatage,
      changeOfSuccessScore: changeOfSuccessScore,
      isFinished: isFinished,
      createOnLocalTime: createOnLocalTime,
      updateOnLocalTime: updateOnLocalTime,
    );
