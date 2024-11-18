// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaxesIncomeTypeStruct extends BaseStruct {
  TaxesIncomeTypeStruct({
    String? guid,
    String? name,
    String? nameEn,
    int? taxesIncomeType,
    bool? active,
  })  : _guid = guid,
        _name = name,
        _nameEn = nameEn,
        _taxesIncomeType = taxesIncomeType,
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

  // "taxesIncomeType" field.
  int? _taxesIncomeType;
  int get taxesIncomeType => _taxesIncomeType ?? 0;
  set taxesIncomeType(int? val) => _taxesIncomeType = val;

  void incrementTaxesIncomeType(int amount) =>
      taxesIncomeType = taxesIncomeType + amount;

  bool hasTaxesIncomeType() => _taxesIncomeType != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? true;
  set active(bool? val) => _active = val;

  bool hasActive() => _active != null;

  static TaxesIncomeTypeStruct fromMap(Map<String, dynamic> data) =>
      TaxesIncomeTypeStruct(
        guid: data['guid'] as String?,
        name: data['name'] as String?,
        nameEn: data['nameEn'] as String?,
        taxesIncomeType: castToType<int>(data['taxesIncomeType']),
        active: data['active'] as bool?,
      );

  static TaxesIncomeTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TaxesIncomeTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'guid': _guid,
        'name': _name,
        'nameEn': _nameEn,
        'taxesIncomeType': _taxesIncomeType,
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
        'taxesIncomeType': serializeParam(
          _taxesIncomeType,
          ParamType.int,
        ),
        'active': serializeParam(
          _active,
          ParamType.bool,
        ),
      }.withoutNulls;

  static TaxesIncomeTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      TaxesIncomeTypeStruct(
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
        taxesIncomeType: deserializeParam(
          data['taxesIncomeType'],
          ParamType.int,
          false,
        ),
        active: deserializeParam(
          data['active'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'TaxesIncomeTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TaxesIncomeTypeStruct &&
        guid == other.guid &&
        name == other.name &&
        nameEn == other.nameEn &&
        taxesIncomeType == other.taxesIncomeType &&
        active == other.active;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([guid, name, nameEn, taxesIncomeType, active]);
}

TaxesIncomeTypeStruct createTaxesIncomeTypeStruct({
  String? guid,
  String? name,
  String? nameEn,
  int? taxesIncomeType,
  bool? active,
}) =>
    TaxesIncomeTypeStruct(
      guid: guid,
      name: name,
      nameEn: nameEn,
      taxesIncomeType: taxesIncomeType,
      active: active,
    );
