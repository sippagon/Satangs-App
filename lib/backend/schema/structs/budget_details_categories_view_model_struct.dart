// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BudgetDetailsCategoriesViewModelStruct extends BaseStruct {
  BudgetDetailsCategoriesViewModelStruct({
    String? guid,
    String? name,
    double? budget,
    double? usageAmount,
    double? usagePercentage,
  })  : _guid = guid,
        _name = name,
        _budget = budget,
        _usageAmount = usageAmount,
        _usagePercentage = usagePercentage;

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

  // "budget" field.
  double? _budget;
  double get budget => _budget ?? 0.0;
  set budget(double? val) => _budget = val;

  void incrementBudget(double amount) => budget = budget + amount;

  bool hasBudget() => _budget != null;

  // "usageAmount" field.
  double? _usageAmount;
  double get usageAmount => _usageAmount ?? 0.0;
  set usageAmount(double? val) => _usageAmount = val;

  void incrementUsageAmount(double amount) =>
      usageAmount = usageAmount + amount;

  bool hasUsageAmount() => _usageAmount != null;

  // "usagePercentage" field.
  double? _usagePercentage;
  double get usagePercentage => _usagePercentage ?? 0.0;
  set usagePercentage(double? val) => _usagePercentage = val;

  void incrementUsagePercentage(double amount) =>
      usagePercentage = usagePercentage + amount;

  bool hasUsagePercentage() => _usagePercentage != null;

  static BudgetDetailsCategoriesViewModelStruct fromMap(
          Map<String, dynamic> data) =>
      BudgetDetailsCategoriesViewModelStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        budget: castToType<double>(data['budget']),
        usageAmount: castToType<double>(data['usageAmount']),
        usagePercentage: castToType<double>(data['usagePercentage']),
      );

  static BudgetDetailsCategoriesViewModelStruct? maybeFromMap(dynamic data) =>
      data is Map
          ? BudgetDetailsCategoriesViewModelStruct.fromMap(
              data.cast<String, dynamic>())
          : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'budget': _budget,
        'usageAmount': _usageAmount,
        'usagePercentage': _usagePercentage,
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
        'budget': serializeParam(
          _budget,
          ParamType.double,
        ),
        'usageAmount': serializeParam(
          _usageAmount,
          ParamType.double,
        ),
        'usagePercentage': serializeParam(
          _usagePercentage,
          ParamType.double,
        ),
      }.withoutNulls;

  static BudgetDetailsCategoriesViewModelStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BudgetDetailsCategoriesViewModelStruct(
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
        budget: deserializeParam(
          data['budget'],
          ParamType.double,
          false,
        ),
        usageAmount: deserializeParam(
          data['usageAmount'],
          ParamType.double,
          false,
        ),
        usagePercentage: deserializeParam(
          data['usagePercentage'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'BudgetDetailsCategoriesViewModelStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BudgetDetailsCategoriesViewModelStruct &&
        guid == other.guid &&
        name == other.name &&
        budget == other.budget &&
        usageAmount == other.usageAmount &&
        usagePercentage == other.usagePercentage;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([guid, name, budget, usageAmount, usagePercentage]);
}

BudgetDetailsCategoriesViewModelStruct
    createBudgetDetailsCategoriesViewModelStruct({
  String? guid,
  String? name,
  double? budget,
  double? usageAmount,
  double? usagePercentage,
}) =>
        BudgetDetailsCategoriesViewModelStruct(
          guid: guid,
          name: name,
          budget: budget,
          usageAmount: usageAmount,
          usagePercentage: usagePercentage,
        );
