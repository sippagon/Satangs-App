// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxesDeductionTypeStruct extends BaseStruct {
  TaxesDeductionTypeStruct({
    String? guid,
    String? name,
    String? nameEn,
    double? maxAmount,
    double? maxPercentIncome,
    int? combinedId,
    double? maxCombinedAmount,
    bool? active,
  })  : _guid = guid,
        _name = name,
        _nameEn = nameEn,
        _maxAmount = maxAmount,
        _maxPercentIncome = maxPercentIncome,
        _combinedId = combinedId,
        _maxCombinedAmount = maxCombinedAmount,
        _active = active;

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

  // "nameEn" field.
  String? _nameEn;
  String get nameEn => _nameEn ?? '';
  set nameEn(String? val) => _nameEn = val;

  bool hasNameEn() => _nameEn != null;

  // "maxAmount" field.
  double? _maxAmount;
  double get maxAmount => _maxAmount ?? 0.0;
  set maxAmount(double? val) => _maxAmount = val;

  void incrementMaxAmount(double amount) => maxAmount = maxAmount + amount;

  bool hasMaxAmount() => _maxAmount != null;

  // "maxPercentIncome" field.
  double? _maxPercentIncome;
  double get maxPercentIncome => _maxPercentIncome ?? 0.0;
  set maxPercentIncome(double? val) => _maxPercentIncome = val;

  void incrementMaxPercentIncome(double amount) =>
      maxPercentIncome = maxPercentIncome + amount;

  bool hasMaxPercentIncome() => _maxPercentIncome != null;

  // "combinedId" field.
  int? _combinedId;
  int get combinedId => _combinedId ?? 0;
  set combinedId(int? val) => _combinedId = val;

  void incrementCombinedId(int amount) => combinedId = combinedId + amount;

  bool hasCombinedId() => _combinedId != null;

  // "maxCombinedAmount" field.
  double? _maxCombinedAmount;
  double get maxCombinedAmount => _maxCombinedAmount ?? 0.0;
  set maxCombinedAmount(double? val) => _maxCombinedAmount = val;

  void incrementMaxCombinedAmount(double amount) =>
      maxCombinedAmount = maxCombinedAmount + amount;

  bool hasMaxCombinedAmount() => _maxCombinedAmount != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? true;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static TaxesDeductionTypeStruct fromMap(Map<String, dynamic> data) =>
      TaxesDeductionTypeStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        nameEn: data['nameEn'] as String?,
        maxAmount: castToType<double>(data['maxAmount']),
        maxPercentIncome: castToType<double>(data['maxPercentIncome']),
        combinedId: castToType<int>(data['combinedId']),
        maxCombinedAmount: castToType<double>(data['maxCombinedAmount']),
        active: data['active'] as bool?,
      );

  static TaxesDeductionTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TaxesDeductionTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'nameEn': _nameEn,
        'maxAmount': _maxAmount,
        'maxPercentIncome': _maxPercentIncome,
        'combinedId': _combinedId,
        'maxCombinedAmount': _maxCombinedAmount,
        'active': _active,
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
        'nameEn': serializeParam(
          _nameEn,
          ParamType.String,
        ),
        'maxAmount': serializeParam(
          _maxAmount,
          ParamType.double,
        ),
        'maxPercentIncome': serializeParam(
          _maxPercentIncome,
          ParamType.double,
        ),
        'combinedId': serializeParam(
          _combinedId,
          ParamType.int,
        ),
        'maxCombinedAmount': serializeParam(
          _maxCombinedAmount,
          ParamType.double,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TaxesDeductionTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TaxesDeductionTypeStruct(
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
        nameEn: deserializeParam(
          data['nameEn'],
          ParamType.String,
          false,
        ),
        maxAmount: deserializeParam(
          data['maxAmount'],
          ParamType.double,
          false,
        ),
        maxPercentIncome: deserializeParam(
          data['maxPercentIncome'],
          ParamType.double,
          false,
        ),
        combinedId: deserializeParam(
          data['combinedId'],
          ParamType.int,
          false,
        ),
        maxCombinedAmount: deserializeParam(
          data['maxCombinedAmount'],
          ParamType.double,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TaxesDeductionTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaxesDeductionTypeStruct &&
        guid == other.guid &&
        name == other.name &&
        nameEn == other.nameEn &&
        maxAmount == other.maxAmount &&
        maxPercentIncome == other.maxPercentIncome &&
        combinedId == other.combinedId &&
        maxCombinedAmount == other.maxCombinedAmount &&
        active == other.active;
  }

  @override
  int get hashCode => const ListEquality().hash([
        guid,
        name,
        nameEn,
        maxAmount,
        maxPercentIncome,
        combinedId,
        maxCombinedAmount,
        active
      ]);
}

TaxesDeductionTypeStruct createTaxesDeductionTypeStruct({
  String? guid,
  String? name,
  String? nameEn,
  double? maxAmount,
  double? maxPercentIncome,
  int? combinedId,
  double? maxCombinedAmount,
  bool? active,
}) =>
    TaxesDeductionTypeStruct(
      guid: guid,
      name: name,
      nameEn: nameEn,
      maxAmount: maxAmount,
      maxPercentIncome: maxPercentIncome,
      combinedId: combinedId,
      maxCombinedAmount: maxCombinedAmount,
      active: active,
    );
