// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetirementCalculationStruct extends BaseStruct {
  RetirementCalculationStruct({
    DateTime? dateOfBirth,
    int? retirementAge,
    int? lifeExpectedAge,
    double? annualIncome,
    double? annualExpenses,
    double? incomeGrowthRate,
    double? inflationRate,
    double? savingsAmount,
    double? savingsPerMonth,
    double? savingsInterest,
  })  : _dateOfBirth = dateOfBirth,
        _retirementAge = retirementAge,
        _lifeExpectedAge = lifeExpectedAge,
        _annualIncome = annualIncome,
        _annualExpenses = annualExpenses,
        _incomeGrowthRate = incomeGrowthRate,
        _inflationRate = inflationRate,
        _savingsAmount = savingsAmount,
        _savingsPerMonth = savingsPerMonth,
        _savingsInterest = savingsInterest;

  // "dateOfBirth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  set dateOfBirth(DateTime? val) => _dateOfBirth = val;

  bool hasDateOfBirth() => _dateOfBirth != null;

  // "retirementAge" field.
  int? _retirementAge;
  int get retirementAge => _retirementAge ?? 0;
  set retirementAge(int? val) => _retirementAge = val;

  void incrementRetirementAge(int amount) =>
      retirementAge = retirementAge + amount;

  bool hasRetirementAge() => _retirementAge != null;

  // "lifeExpectedAge" field.
  int? _lifeExpectedAge;
  int get lifeExpectedAge => _lifeExpectedAge ?? 0;
  set lifeExpectedAge(int? val) => _lifeExpectedAge = val;

  void incrementLifeExpectedAge(int amount) =>
      lifeExpectedAge = lifeExpectedAge + amount;

  bool hasLifeExpectedAge() => _lifeExpectedAge != null;

  // "annualIncome" field.
  double? _annualIncome;
  double get annualIncome => _annualIncome ?? 0.0;
  set annualIncome(double? val) => _annualIncome = val;

  void incrementAnnualIncome(double amount) =>
      annualIncome = annualIncome + amount;

  bool hasAnnualIncome() => _annualIncome != null;

  // "annualExpenses" field.
  double? _annualExpenses;
  double get annualExpenses => _annualExpenses ?? 0.0;
  set annualExpenses(double? val) => _annualExpenses = val;

  void incrementAnnualExpenses(double amount) =>
      annualExpenses = annualExpenses + amount;

  bool hasAnnualExpenses() => _annualExpenses != null;

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

  // "savingsAmount" field.
  double? _savingsAmount;
  double get savingsAmount => _savingsAmount ?? 0.0;
  set savingsAmount(double? val) => _savingsAmount = val;

  void incrementSavingsAmount(double amount) =>
      savingsAmount = savingsAmount + amount;

  bool hasSavingsAmount() => _savingsAmount != null;

  // "savingsPerMonth" field.
  double? _savingsPerMonth;
  double get savingsPerMonth => _savingsPerMonth ?? 0.0;
  set savingsPerMonth(double? val) => _savingsPerMonth = val;

  void incrementSavingsPerMonth(double amount) =>
      savingsPerMonth = savingsPerMonth + amount;

  bool hasSavingsPerMonth() => _savingsPerMonth != null;

  // "savingsInterest" field.
  double? _savingsInterest;
  double get savingsInterest => _savingsInterest ?? 0.0;
  set savingsInterest(double? val) => _savingsInterest = val;

  void incrementSavingsInterest(double amount) =>
      savingsInterest = savingsInterest + amount;

  bool hasSavingsInterest() => _savingsInterest != null;

  static RetirementCalculationStruct fromMap(Map<String, dynamic> data) =>
      RetirementCalculationStruct(
        dateOfBirth: data['dateOfBirth'] as DateTime?,
        retirementAge: castToType<int>(data['retirementAge']),
        lifeExpectedAge: castToType<int>(data['lifeExpectedAge']),
        annualIncome: castToType<double>(data['annualIncome']),
        annualExpenses: castToType<double>(data['annualExpenses']),
        incomeGrowthRate: castToType<double>(data['incomeGrowthRate']),
        inflationRate: castToType<double>(data['inflationRate']),
        savingsAmount: castToType<double>(data['savingsAmount']),
        savingsPerMonth: castToType<double>(data['savingsPerMonth']),
        savingsInterest: castToType<double>(data['savingsInterest']),
      );

  static RetirementCalculationStruct? maybeFromMap(dynamic data) => data is Map
      ? RetirementCalculationStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dateOfBirth': _dateOfBirth,
        'retirementAge': _retirementAge,
        'lifeExpectedAge': _lifeExpectedAge,
        'annualIncome': _annualIncome,
        'annualExpenses': _annualExpenses,
        'incomeGrowthRate': _incomeGrowthRate,
        'inflationRate': _inflationRate,
        'savingsAmount': _savingsAmount,
        'savingsPerMonth': _savingsPerMonth,
        'savingsInterest': _savingsInterest,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dateOfBirth': serializeParam(
          _dateOfBirth,
          ParamType.DateTime,
        ),
        'retirementAge': serializeParam(
          _retirementAge,
          ParamType.int,
        ),
        'lifeExpectedAge': serializeParam(
          _lifeExpectedAge,
          ParamType.int,
        ),
        'annualIncome': serializeParam(
          _annualIncome,
          ParamType.double,
        ),
        'annualExpenses': serializeParam(
          _annualExpenses,
          ParamType.double,
        ),
        'incomeGrowthRate': serializeParam(
          _incomeGrowthRate,
          ParamType.double,
        ),
        'inflationRate': serializeParam(
          _inflationRate,
          ParamType.double,
        ),
        'savingsAmount': serializeParam(
          _savingsAmount,
          ParamType.double,
        ),
        'savingsPerMonth': serializeParam(
          _savingsPerMonth,
          ParamType.double,
        ),
        'savingsInterest': serializeParam(
          _savingsInterest,
          ParamType.double,
        ),
      }.withoutNulls;

  static RetirementCalculationStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RetirementCalculationStruct(
        dateOfBirth: deserializeParam(
          data['dateOfBirth'],
          ParamType.DateTime,
          false,
        ),
        retirementAge: deserializeParam(
          data['retirementAge'],
          ParamType.int,
          false,
        ),
        lifeExpectedAge: deserializeParam(
          data['lifeExpectedAge'],
          ParamType.int,
          false,
        ),
        annualIncome: deserializeParam(
          data['annualIncome'],
          ParamType.double,
          false,
        ),
        annualExpenses: deserializeParam(
          data['annualExpenses'],
          ParamType.double,
          false,
        ),
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
        savingsAmount: deserializeParam(
          data['savingsAmount'],
          ParamType.double,
          false,
        ),
        savingsPerMonth: deserializeParam(
          data['savingsPerMonth'],
          ParamType.double,
          false,
        ),
        savingsInterest: deserializeParam(
          data['savingsInterest'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RetirementCalculationStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RetirementCalculationStruct &&
        dateOfBirth == other.dateOfBirth &&
        retirementAge == other.retirementAge &&
        lifeExpectedAge == other.lifeExpectedAge &&
        annualIncome == other.annualIncome &&
        annualExpenses == other.annualExpenses &&
        incomeGrowthRate == other.incomeGrowthRate &&
        inflationRate == other.inflationRate &&
        savingsAmount == other.savingsAmount &&
        savingsPerMonth == other.savingsPerMonth &&
        savingsInterest == other.savingsInterest;
  }

  @override
  int get hashCode => const ListEquality().hash([
        dateOfBirth,
        retirementAge,
        lifeExpectedAge,
        annualIncome,
        annualExpenses,
        incomeGrowthRate,
        inflationRate,
        savingsAmount,
        savingsPerMonth,
        savingsInterest
      ]);
}

RetirementCalculationStruct createRetirementCalculationStruct({
  DateTime? dateOfBirth,
  int? retirementAge,
  int? lifeExpectedAge,
  double? annualIncome,
  double? annualExpenses,
  double? incomeGrowthRate,
  double? inflationRate,
  double? savingsAmount,
  double? savingsPerMonth,
  double? savingsInterest,
}) =>
    RetirementCalculationStruct(
      dateOfBirth: dateOfBirth,
      retirementAge: retirementAge,
      lifeExpectedAge: lifeExpectedAge,
      annualIncome: annualIncome,
      annualExpenses: annualExpenses,
      incomeGrowthRate: incomeGrowthRate,
      inflationRate: inflationRate,
      savingsAmount: savingsAmount,
      savingsPerMonth: savingsPerMonth,
      savingsInterest: savingsInterest,
    );
