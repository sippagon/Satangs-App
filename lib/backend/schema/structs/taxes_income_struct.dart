// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxesIncomeStruct extends BaseStruct {
  TaxesIncomeStruct({
    double? salary,
    double? bonus,
    double? other,
    double? total,
  })  : _salary = salary,
        _bonus = bonus,
        _other = other,
        _total = total;

  // "salary" field.
  double? _salary;
  double get salary => _salary ?? 0.0;
  set salary(double? val) => _salary = val;

  void incrementSalary(double amount) => salary = salary + amount;

  bool hasSalary() => _salary != null;

  // "bonus" field.
  double? _bonus;
  double get bonus => _bonus ?? 0.0;
  set bonus(double? val) => _bonus = val;

  void incrementBonus(double amount) => bonus = bonus + amount;

  bool hasBonus() => _bonus != null;

  // "other" field.
  double? _other;
  double get other => _other ?? 0.0;
  set other(double? val) => _other = val;

  void incrementOther(double amount) => other = other + amount;

  bool hasOther() => _other != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

  bool hasTotal() => _total != null;

  static TaxesIncomeStruct fromMap(Map<String, dynamic> data) =>
      TaxesIncomeStruct(
        salary: castToType<double>(data['salary']),
        bonus: castToType<double>(data['bonus']),
        other: castToType<double>(data['other']),
        total: castToType<double>(data['total']),
      );

  static TaxesIncomeStruct? maybeFromMap(dynamic data) => data is Map
      ? TaxesIncomeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'salary': _salary,
        'bonus': _bonus,
        'other': _other,
        'total': _total,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'salary': serializeParam(
          _salary,
          ParamType.double,
        ),
        'bonus': serializeParam(
          _bonus,
          ParamType.double,
        ),
        'other': serializeParam(
          _other,
          ParamType.double,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
      }.withoutNulls;

  static TaxesIncomeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaxesIncomeStruct(
        salary: deserializeParam(
          data['salary'],
          ParamType.double,
          false,
        ),
        bonus: deserializeParam(
          data['bonus'],
          ParamType.double,
          false,
        ),
        other: deserializeParam(
          data['other'],
          ParamType.double,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'TaxesIncomeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaxesIncomeStruct &&
        salary == other.salary &&
        bonus == other.bonus &&
        other == other.other &&
        total == other.total;
  }

  @override
  int get hashCode => const ListEquality().hash([salary, bonus, other, total]);
}

TaxesIncomeStruct createTaxesIncomeStruct({
  double? salary,
  double? bonus,
  double? other,
  double? total,
}) =>
    TaxesIncomeStruct(
      salary: salary,
      bonus: bonus,
      other: other,
      total: total,
    );
