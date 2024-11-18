// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetTrasactionCategoriesStruct extends BaseStruct {
  BudgetTrasactionCategoriesStruct({
    String? guid,
    String? name,
    double? amount,
  })  : _guid = guid,
        _name = name,
        _amount = amount;

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

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  static BudgetTrasactionCategoriesStruct fromMap(Map<String, dynamic> data) =>
      BudgetTrasactionCategoriesStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        amount: castToType<double>(data['amount']),
      );

  static BudgetTrasactionCategoriesStruct? maybeFromMap(dynamic data) => data
          is Map
      ? BudgetTrasactionCategoriesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'amount': _amount,
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
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
      }.withoutNulls;

  static BudgetTrasactionCategoriesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BudgetTrasactionCategoriesStruct(
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
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BudgetTrasactionCategoriesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BudgetTrasactionCategoriesStruct &&
        guid == other.guid &&
        name == other.name &&
        amount == other.amount;
  }

  @override
  int get hashCode => const ListEquality().hash([guid, name, amount]);
}

BudgetTrasactionCategoriesStruct createBudgetTrasactionCategoriesStruct({
  String? guid,
  String? name,
  double? amount,
}) =>
    BudgetTrasactionCategoriesStruct(
      guid: guid,
      name: name,
      amount: amount,
    );
