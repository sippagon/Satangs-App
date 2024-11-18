// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RetirementCalculationLineChartStruct extends BaseStruct {
  RetirementCalculationLineChartStruct({
    int? age,
    double? income,
    double? expense,
    double? savings,
  })  : _age = age,
        _income = income,
        _expense = expense,
        _savings = savings;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;

  void incrementAge(int amount) => age = age + amount;

  bool hasAge() => _age != null;

  // "income" field.
  double? _income;
  double get income => _income ?? 0.0;
  set income(double? val) => _income = val;

  void incrementIncome(double amount) => income = income + amount;

  bool hasIncome() => _income != null;

  // "expense" field.
  double? _expense;
  double get expense => _expense ?? 0.0;
  set expense(double? val) => _expense = val;

  void incrementExpense(double amount) => expense = expense + amount;

  bool hasExpense() => _expense != null;

  // "savings" field.
  double? _savings;
  double get savings => _savings ?? 0.0;
  set savings(double? val) => _savings = val;

  void incrementSavings(double amount) => savings = savings + amount;

  bool hasSavings() => _savings != null;

  static RetirementCalculationLineChartStruct fromMap(
          Map<String, dynamic> data) =>
      RetirementCalculationLineChartStruct(
        age: castToType<int>(data['age']),
        income: castToType<double>(data['income']),
        expense: castToType<double>(data['expense']),
        savings: castToType<double>(data['savings']),
      );

  static RetirementCalculationLineChartStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? RetirementCalculationLineChartStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'age': _age,
        'income': _income,
        'expense': _expense,
        'savings': _savings,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'income': serializeParam(
          _income,
          ParamType.double,
        ),
        'expense': serializeParam(
          _expense,
          ParamType.double,
        ),
        'savings': serializeParam(
          _savings,
          ParamType.double,
        ),
      }.withoutNulls;

  static RetirementCalculationLineChartStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RetirementCalculationLineChartStruct(
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        income: deserializeParam(
          data['income'],
          ParamType.double,
          false,
        ),
        expense: deserializeParam(
          data['expense'],
          ParamType.double,
          false,
        ),
        savings: deserializeParam(
          data['savings'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RetirementCalculationLineChartStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RetirementCalculationLineChartStruct &&
        age == other.age &&
        income == other.income &&
        expense == other.expense &&
        savings == other.savings;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([age, income, expense, savings]);
}

RetirementCalculationLineChartStruct
    createRetirementCalculationLineChartStruct({
  int? age,
  double? income,
  double? expense,
  double? savings,
}) =>
        RetirementCalculationLineChartStruct(
          age: age,
          income: income,
          expense: expense,
          savings: savings,
        );
